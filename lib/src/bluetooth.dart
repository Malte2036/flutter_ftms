import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'ftms.dart';

FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

requestBluetoothPermissions() async {
  print("requestPermissions");
  await [
    Permission.location,
    Permission.storage,
    Permission.bluetooth,
    Permission.bluetoothConnect,
    Permission.bluetoothScan
  ].request();
}

scanForBluetoothDevices() async {
  print("scanForBluetoothDevices");

  flutterBlue.startScan(timeout: const Duration(seconds: 4));

  var subscription = flutterBlue.scanResults.listen((results) async {
    for (ScanResult r in results) {
      //print('${r.device.name} found! rssi: ${r.rssi}');
    }
  });
}

connectToBluetoothDevice(BluetoothDevice device) {
  //await device.pair();

  print('connectToBluetoothDevice: ${device.name}');
  device.connect();
}

disconnectFromBluetoothDevice(BluetoothDevice device) {
  print('disconnectFromBluetoothDevice: ${device.name}');
  device.disconnect();
}

const ftmsServiceUUID = "00001826";

const statusChar = "00002AD9";
const dataChar = "00002ACE";

const characteristicFTMSFeature = "00002ACC";

querySupportedFTMSFeatures(
    BluetoothDevice device, Function(FTMSCrossTrainer) onData) async {
  print('querySupportedFTMSFeatures');

  var services = await device.discoverServices();
  // FTMS service starts with 00001826
  var service = services.firstWhere((service) =>
      service.uuid.toString().toUpperCase().startsWith(ftmsServiceUUID));

  print('Found FTMS service: ${service.uuid}');

  await useFeatureCharacteristic(service);

  await useDataCharacteristic(service, onData);

  /*List<int> request = [0x04, 0x00];
  await characteristic.write(request);*/
}

var lastData = "";

useDataCharacteristic(ftmsService, Function(FTMSCrossTrainer) onData) async {
  var characteristicData = ftmsService.characteristics.firstWhere(
      (characteristic) =>
          characteristic.uuid.toString().toUpperCase().startsWith(dataChar));

  print('Found FTMS characteristic: ${characteristicData.uuid}');

  bool isFirst = true;

  StreamSubscription notificationSubscription;
  notificationSubscription =
      characteristicData.value.listen((List<int> ftmsData) {
    if (ftmsData.isEmpty) return;

    FTMSCrossTrainer ftms = FTMSCrossTrainer(ftmsData);
    if (isFirst) {
      ftms.getFTMSDataFeatures();
      isFirst = false;
    }
    if (lastData != ftmsData.toString()) {
      print('ftmsData: ${ftmsData}');
      lastData = ftmsData.toString();
    }

    onData(ftms);
  });
  await characteristicData.setNotifyValue(true);
}

useFeatureCharacteristic(ftmsService) async {
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

Future<bool> isDeviceFTMSCrossTrainer(BluetoothDevice device) async {
  return true;
  var services = await device.discoverServices();
  return services
      .where((service) =>
          service.uuid.toString().toUpperCase().startsWith(ftmsServiceUUID))
      .toList()
      .isEmpty;
}
