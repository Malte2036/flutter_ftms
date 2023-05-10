library flutter_ftms;

import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_ftms/src/bluetooth.dart';
import 'package:flutter_ftms/src/ftms/devices/indoor_bike.dart';
import 'package:flutter_ftms/src/ftms/ftms_data.dart';

export 'src/ftms/ftms_data.dart' show FTMSData, FTMSDataType;
export 'src/ftms/devices/cross_trainer.dart' show CrossTrainer;
export 'src/ftms/devices/indoor_bike.dart' show IndoorBike;

class FTMS {
  static Stream<bool> isScanning = Bluetooth.isScanningStream;
  static Stream<List<ScanResult>> get scanResults =>
      Bluetooth.scanResultsStream;

  static Future<void> scanForBluetoothDevices() async {
    await Bluetooth.scanForBluetoothDevices();
  }

  static Future<void> connectToFTMSDevice(BluetoothDevice device) async {
    await Bluetooth.connectToBluetoothDevice(device);
  }

  static Future<void> disconnectFromFTMSDevice(BluetoothDevice device) async {
    await Bluetooth.disconnectFromBluetoothDevice(device);
  }

  static Future<bool> isDeviceFTMSDevice(BluetoothDevice device) async {
    return Bluetooth.isDeviceFTMSDevice(device);
  }

  static Future<void> querySupportedFTMSFeatures(BluetoothDevice device,
      FTMSDataType dataType, Function(FTMSData) onData) async {
    await Bluetooth.querySupportedFTMSFeatures(device, dataType, onData);
  }

  static Future<FTMSDataType> getFTMSDeviceType(BluetoothDevice device) async {
    return FTMSDataType.indoorBike;
  }
}
