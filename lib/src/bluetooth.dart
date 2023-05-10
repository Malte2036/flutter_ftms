import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_ftms/src/ftms/devices/cross_trainer.dart';
import 'package:flutter_ftms/src/ftms/devices/indoor_bike.dart';
import 'package:flutter_ftms/src/ftms/ftms_data.dart';
import 'package:permission_handler/permission_handler.dart';

class Bluetooth {
  static FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  static requestBluetoothPermissions() async {
    print("requestPermissions");
    await [
      Permission.location,
      Permission.storage,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan
    ].request();
  }

  static Stream<bool> isScanningStream = flutterBlue.isScanning;
  static Stream<List<ScanResult>> scanResultsStream = flutterBlue.scanResults;

  static scanForBluetoothDevices() async {
    print("scanForBluetoothDevices");

    await requestBluetoothPermissions();

    //await flutterBlue.turnOn();

    flutterBlue.startScan(timeout: const Duration(seconds: 4));
  }

  static connectToBluetoothDevice(BluetoothDevice device) {
    //await device.pair();

    print('connectToBluetoothDevice: ${device.name}');
    device.connect();
  }

  static disconnectFromBluetoothDevice(BluetoothDevice device) {
    print('disconnectFromBluetoothDevice: ${device.name}');
    device.disconnect();
  }

  static const ftmsServiceUUID = "00001826";

  static const statusChar = "00002AD9";
  static const dataCharCrossTrainer = "00002ACE";
  static const dataCharIndoorBike = "00002AD2";

  static const characteristicFTMSFeature = "00002ACC";

  static querySupportedFTMSFeatures(BluetoothDevice device,
      FTMSDataType dataType, Function(FTMSData) onData) async {
    print('querySupportedFTMSFeatures');

    var services = await device.discoverServices();
    // FTMS service starts with 00001826
    var service = services.firstWhere((service) =>
        service.uuid.toString().toUpperCase().startsWith(ftmsServiceUUID));

    print('Found FTMS service: ${service.uuid}');

    await useFeatureCharacteristic(service);

    await useDataCharacteristic(service, dataType, onData);
  }

  static useDataCharacteristic(
      ftmsService, FTMSDataType dataType, Function(FTMSData) onData) async {
    var characteristicData = ftmsService.characteristics.firstWhere(
        (characteristic) => characteristic.uuid
            .toString()
            .toUpperCase()
            .startsWith(dataCharIndoorBike));

    print('Found FTMS characteristic: ${characteristicData.uuid}');

    StreamSubscription notificationSubscription;
    notificationSubscription =
        characteristicData.value.listen((List<int> ftmsData) {
      if (ftmsData.isEmpty) return;

      FTMSData ftms = _createFTMSDataByFTMSDataType(dataType, ftmsData);

      onData(ftms);
      print(ftmsData);
    });
    await characteristicData.setNotifyValue(true);
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

  static useFeatureCharacteristic(ftmsService) async {
    var characteristicData = ftmsService.characteristics.firstWhere(
        (characteristic) => characteristic.uuid
            .toString()
            .toUpperCase()
            .startsWith(characteristicFTMSFeature));

    print('Found Feature characteristic: ${characteristicData.uuid}');

    StreamSubscription notificationSubscription;
    notificationSubscription = characteristicData.value.listen((data) {
      print('featureData: ${data}');
    });
  }

  static Future<bool> isDeviceFTMSDevice(BluetoothDevice device) async {
    var services = await device.discoverServices();
    return services
        .where((service) =>
            service.uuid.toString().toUpperCase().startsWith(ftmsServiceUUID))
        .toList()
        .isNotEmpty;
  }
}
