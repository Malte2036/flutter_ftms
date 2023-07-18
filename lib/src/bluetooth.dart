import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
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

  static Stream<BluetoothState> stateStream =
      flutterBlue.state.asBroadcastStream();
  static Stream<bool> isScanningStream = flutterBlue.isScanning;
  static Stream<List<ScanResult>> scanResultsStream = flutterBlue.scanResults;

  static Future<bool> isEnabled() async {
    return await flutterBlue.isOn;
  }

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
}
