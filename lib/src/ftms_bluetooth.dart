import 'dart:async';

import 'package:flutter_ftms/flutter_ftms.dart';

class FTMSBluetooth {
  static const _ftmsServiceUUID = "00001826";

  // ignore: unused_field
  static const _statusChar = "00002AD9";
  static const _dataCrossTrainerChar = "00002ACE";
  static const _dataIndoorBikeChar = "00002AD2";

  // ignore: unused_field
  static const _featureChar = "00002ACC";

  static useDataCharacteristic(BluetoothService ftmsService,
      FTMSDataType dataType, void Function(FTMSData) onData) async {
    var dataCharUuid = _getBluetoothCharacteristicUUID(dataType);
    var characteristicData = ftmsService.characteristics.firstWhere(
        (characteristic) => characteristic.uuid
            .toString()
            .toUpperCase()
            .startsWith(dataCharUuid));

    print('Found FTMS characteristic: ${characteristicData.uuid}');

    characteristicData.value.listen((List<int> ftmsData) {
      if (ftmsData.isEmpty) return;

      FTMSData ftms = _createFTMSDataByFTMSDataType(dataType, ftmsData);

      onData(ftms);
      print(ftmsData);
    });
    await characteristicData.setNotifyValue(true);

    await readFeatureCharacteristic(ftmsService);
  }

  static FTMSData _createFTMSDataByFTMSDataType(
      FTMSDataType type, List<int> ftmsData) {
    switch (type) {
      case FTMSDataType.crossTrainer:
        return CrossTrainer(ftmsData);
      case FTMSDataType.indoorBike:
        return IndoorBike(ftmsData);
      default:
        throw 'FTMSDataType $type is not implemented!';
    }
  }

  static Future<FTMSFeature?> readFeatureCharacteristic(
      BluetoothService ftmsService) async {
    var characteristicData = ftmsService.characteristics.firstWhere(
        (characteristic) => characteristic.uuid
            .toString()
            .toUpperCase()
            .startsWith(_featureChar));

    print('Found Feature characteristic: ${characteristicData.uuid}');

    var data = await characteristicData.read();
    print('featureData: $data');

    if (data.isEmpty) {
      return null;
    }

    return FTMSFeature(data);
  }

  static Future<BluetoothService?> getFTMSService(
      BluetoothDevice device) async {
    var services = await device.discoverServices();
    // FTMS service starts with 00001826
    var service = services.firstWhere((service) =>
        service.uuid.toString().toUpperCase().startsWith(_ftmsServiceUUID));

    print('Found FTMS service: ${service.uuid}');
    return service;
  }

  static Future<bool> isBluetoothDeviceFTMSDevice(
      BluetoothDevice device) async {
    if (await device.state.first == BluetoothDeviceState.disconnected) {
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
      BluetoothService ftmsService, String startsWithUUID) {
    var chars = ftmsService.characteristics
        .where((element) => _characteristicStartWith(element, startsWithUUID))
        .toList();

    return chars.isNotEmpty ? chars[0] : null;
  }

  static Future<FTMSDataType?> getFTMSDataType(
      BluetoothService ftmsService) async {
    if (_getBluetoothCharacteristic(ftmsService, _dataCrossTrainerChar) !=
        null) {
      return FTMSDataType.crossTrainer;
    }

    if (_getBluetoothCharacteristic(ftmsService, _dataIndoorBikeChar) != null) {
      return FTMSDataType.indoorBike;
    }

    print("No FTMSDataType found");
    return null;
  }

  static String _getBluetoothCharacteristicUUID(FTMSDataType dataType) {
    switch (dataType) {
      case FTMSDataType.crossTrainer:
        return _dataCrossTrainerChar;
      case FTMSDataType.indoorBike:
        return _dataIndoorBikeChar;
      default:
        throw 'FTMSDataType $dataType not found!';
    }
  }
}
