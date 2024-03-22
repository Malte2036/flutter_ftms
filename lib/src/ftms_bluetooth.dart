import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/utils.dart';

class FTMSBluetooth {
  static const _ftmsServiceUUID = "00001826";

  static const _dataCrossTrainerChar = "00002ACE";
  static const _dataIndoorBikeChar = "00002AD2";
  static const _dataTreadmillChar = "00002ACD";
  static const _dataRowerChar = "00002AD1";

  static const _featureChar = "00002ACC";
  static const _machineStatusChar = "00002ADA";
  static const _machineControlPointChar = "00002AD9";
  // ignore: unused_field
  static const _trainingStatusChar = "00002AD3";

  static Future<void> useDeviceDataCharacteristic(BluetoothService ftmsService,
      DeviceDataType dataType, void Function(DeviceData) onData) async {
    var dataChar = _getBluetoothCharacteristicUUID(dataType);
    var characteristicData = _getBluetoothCharacteristic(ftmsService, dataChar,
        characteristicRead: false,
        characteristicNotify: true,
        characteristicWrite: false);

    if (characteristicData == null) {
      return;
    }

    print('Found FTMS device data characteristic: ${characteristicData.uuid}');

    characteristicData.onValueReceived.listen((List<int> data) {
      if (data.isEmpty) return;
      print('device data: $data');

      DeviceData deviceData = _createDeviceDataByDeviceDataType(dataType, data);
      onData(deviceData);
    });
    await characteristicData.setNotifyValue(true);

    await readMachineFeatureCharacteristic(ftmsService);
  }

  static Future<MachineFeature?> readMachineFeatureCharacteristic(
      BluetoothService ftmsService) async {
    var characteristicData = _getBluetoothCharacteristic(
        ftmsService, _featureChar,
        characteristicRead: true,
        characteristicNotify: false,
        characteristicWrite: false);

    if (characteristicData == null) {
      return null;
    }

    print('Found Feature characteristic: ${characteristicData.uuid}');

    var data = await characteristicData.read();
    print('featureData: $data');

    if (data.isEmpty) {
      return null;
    }

    return MachineFeature(data);
  }

  static Future<void> useMachineStatusCharacteristic(
      BluetoothService ftmsService, void Function(MachineStatus) onData) async {
    var characteristicData = _getBluetoothCharacteristic(
        ftmsService, _machineStatusChar,
        characteristicRead: false,
        characteristicNotify: true,
        characteristicWrite: false);
    if (characteristicData == null) {
      return;
    }

    print('Found Machine Status characteristic: ${characteristicData.uuid}');

    characteristicData.onValueReceived.listen((data) {
      if (data.isEmpty) {
        return;
      }
      print(data);

      var status = MachineStatus(data);
      onData(status);
    });
    await characteristicData.setNotifyValue(true);
  }

  static Future<void> writeMachineControlPointCharacteristic(
      BluetoothService ftmsService, MachineControlPoint controlPoint) async {
    var characteristicData = _getBluetoothCharacteristic(
        ftmsService, _machineControlPointChar,
        characteristicRead: false,
        characteristicNotify: false,
        characteristicWrite: true);
    if (characteristicData == null) {
      return;
    }

    await characteristicData.write(controlPoint.getWriteData());
  }

  static Future<BluetoothService?> getFTMSService(
      BluetoothDevice device) async {
    var services = await device.discoverServices();

    try {
      // FTMS service starts with 00001826
      var service = services.firstWhere((service) =>
          service.uuid.str128.toUpperCase().startsWith(_ftmsServiceUUID));

      print('Found FTMS service: ${service.uuid.str128}');
      return service;
    } catch (e) {
      print('FTMS service not found');
      return null;
    }
  }

  static Future<bool> isBluetoothDeviceFTMSDevice(
      BluetoothDevice device) async {
    if (await device.connectionState.first ==
        BluetoothConnectionState.disconnected) {
      return false;
    }

    var service = await getFTMSService(device);

    return service != null;
  }

  static bool _characteristicStartWith(
      BluetoothCharacteristic characteristic, String startsWithValue) {
    return characteristic.uuid
        .toString()
        .toUpperCase()
        .startsWith(startsWithValue.toUpperCase());
  }

  static BluetoothCharacteristic? _getBluetoothCharacteristic(
    BluetoothService ftmsService,
    String startsWithUUID, {
    required bool characteristicRead,
    required bool characteristicNotify,
    required bool characteristicWrite,
  }) {
    var chars = ftmsService.characteristics
        .where((element) => _characteristicStartWith(element, startsWithUUID))
        .toList();

    if (chars.isEmpty) {
      return null;
    }

    BluetoothCharacteristic char = chars[0];

    if (characteristicRead && !char.properties.read) {
      throw 'read not supported on characteristic: ${char.uuid}';
    }

    if (characteristicNotify && !char.properties.notify) {
      throw 'notify not supported on characteristic: ${char.uuid}';
    }

    if (characteristicWrite && !char.properties.write) {
      throw 'write not supported on characteristic: ${char.uuid}';
    }

    return char;
  }

  static Future<DeviceDataType?> getDeviceDataType(
      BluetoothService ftmsService) async {
    if (_getBluetoothCharacteristic(ftmsService, _dataCrossTrainerChar,
            characteristicRead: false,
            characteristicNotify: true,
            characteristicWrite: false) !=
        null) {
      return DeviceDataType.crossTrainer;
    }

    if (_getBluetoothCharacteristic(ftmsService, _dataIndoorBikeChar,
            characteristicRead: false,
            characteristicNotify: true,
            characteristicWrite: false) !=
        null) {
      return DeviceDataType.indoorBike;
    }

    if (_getBluetoothCharacteristic(ftmsService, _dataTreadmillChar,
            characteristicRead: false,
            characteristicNotify: true,
            characteristicWrite: false) !=
        null) {
      return DeviceDataType.treadmill;
    }

    if (_getBluetoothCharacteristic(ftmsService, _dataRowerChar,
            characteristicRead: false,
            characteristicNotify: true,
            characteristicWrite: false) !=
        null) {
      return DeviceDataType.rower;
    }

    print("No DeviceDataType found");
    return null;
  }

  static DeviceDataType? getDeviceDataTypeByBluetoothId(String id) {
    var data = List<int>.from(id
        .split(":")
        .getRange(4, 6)
        .map((s) => int.parse(s, radix: 16))
        .toList()
        .reversed);
    var typeNum = Utils.intArrayToLittleEndian(data);

    if (Utils.isNthBitSet(typeNum, 0)) {
      return DeviceDataType.treadmill;
    }
    if (Utils.isNthBitSet(typeNum, 1)) {
      return DeviceDataType.crossTrainer;
    }
    if (Utils.isNthBitSet(typeNum, 4)) {
      return DeviceDataType.rower;
    }
    if (Utils.isNthBitSet(typeNum, 5)) {
      return DeviceDataType.indoorBike;
    }
    return null;
  }

  static String _getBluetoothCharacteristicUUID(DeviceDataType dataType) {
    switch (dataType) {
      case DeviceDataType.crossTrainer:
        return _dataCrossTrainerChar;
      case DeviceDataType.indoorBike:
        return _dataIndoorBikeChar;
      case DeviceDataType.treadmill:
        return _dataTreadmillChar;
      case DeviceDataType.rower:
        return _dataRowerChar;
      default:
        throw 'DeviceDataType $dataType not found!';
    }
  }

  static DeviceData _createDeviceDataByDeviceDataType(
      DeviceDataType type, List<int> deviceData) {
    switch (type) {
      case DeviceDataType.crossTrainer:
        return CrossTrainer(deviceData);
      case DeviceDataType.indoorBike:
        return IndoorBike(deviceData);
      case DeviceDataType.treadmill:
        return Treadmill(deviceData);
      case DeviceDataType.rower:
        return Rower(deviceData);
      default:
        throw 'DeviceDataType $type is not implemented!';
    }
  }
}
