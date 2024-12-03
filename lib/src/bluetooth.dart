import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class Bluetooth {
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

  static Stream<BluetoothAdapterState> stateStream =
      FlutterBluePlus.adapterState.asBroadcastStream();
  static Stream<bool> isScanningStream = FlutterBluePlus.isScanning;
  static Stream<List<ScanResult>> scanResultsStream =
      FlutterBluePlus.scanResults;

  static Future<List<BluetoothDevice>> getConnectedDevice(
    List<Guid> withServices,
  ) async {
    return await FlutterBluePlus.systemDevices(withServices);
  }

  static Future<bool> isEnabled() async {
    return await FlutterBluePlus.isSupported;
  }

  static scanForBluetoothDevices(
    List<Guid> withServices,
  ) async {
    print("scanForBluetoothDevices");

    await requestBluetoothPermissions();

    //await flutterBlue.turnOn();

    FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 4), withServices: withServices);
  }

  static connectToBluetoothDevice(BluetoothDevice device) {
    //await device.pair();

    print('connectToBluetoothDevice: ${device.platformName}');
    device.connect();
  }

  static disconnectFromBluetoothDevice(BluetoothDevice device) {
    print('disconnectFromBluetoothDevice: ${device.platformName}');
    device.disconnect();
  }
}
