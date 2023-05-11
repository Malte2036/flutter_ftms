library flutter_ftms;

import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_ftms/src/bluetooth.dart';
import 'package:flutter_ftms/src/ftms/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/ftms_feature.dart';
import 'package:flutter_ftms/src/ftms_bluetooth.dart';

export 'src/ftms/ftms_data.dart' show FTMSData, FTMSDataType;
export 'src/ftms/ftms_feature.dart' show FTMSFeature;
export 'src/ftms/ftms_feature_flag.dart' show FTMSFeatureFlag;
export 'src/ftms/devices/cross_trainer.dart' show CrossTrainer;
export 'src/ftms/devices/indoor_bike.dart' show IndoorBike;

class FTMS {
  static Stream<bool> get isScanning => Bluetooth.isScanningStream;
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

  static Future<bool> isBluetoothDeviceFTMSDevice(
      BluetoothDevice device) async {
    return FTMSBluetooth.isBluetoothDeviceFTMSDevice(device);
  }

  static Future<void> useDataCharacteristic(
      BluetoothDevice device, void Function(FTMSData) onData) async {
    var dataType = await getFTMSDeviceType(device);
    if (dataType == null) return;

    var service = await FTMSBluetooth.getFTMSService(device);
    if (service == null) return;

    await FTMSBluetooth.useDataCharacteristic(service, dataType, onData);
  }

  static Future<FTMSDataType?> getFTMSDeviceType(BluetoothDevice device) async {
    var service = await FTMSBluetooth.getFTMSService(device);
    if (service == null) {
      print("No FTMS Service found!");
      return null;
    }

    return FTMSBluetooth.getFTMSDataType(service);
  }

  static String convertFTMSDataTypeToString(FTMSDataType dataType) {
    switch (dataType) {
      case FTMSDataType.crossTrainer:
        return "Cross Trainer";
      case FTMSDataType.indoorBike:
        return "Indoor Bike";
    }

    // ignore: dead_code
    throw 'FTMSDataType $dataType does not exists';
  }

  static Future<FTMSFeature?> readFeatureCharacteristic(
      BluetoothDevice device) async {
    var service = await FTMSBluetooth.getFTMSService(device);
    if (service == null) {
      print("No FTMS Service found!");
      return null;
    }

    return await FTMSBluetooth.readFeatureCharacteristic(service);
  }
}
