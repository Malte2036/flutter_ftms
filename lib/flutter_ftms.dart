library flutter_ftms;

import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_ftms/src/bluetooth.dart';
import 'package:flutter_ftms/src/ftms/characteristic/machine/control_point/machine_control_point.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/device_data.dart';
import 'package:flutter_ftms/src/ftms/characteristic/machine/feature/machine_feature.dart';
import 'package:flutter_ftms/src/ftms/characteristic/machine/status/machine_status.dart';
import 'package:flutter_ftms/src/ftms_bluetooth.dart';

export 'src/ftms/characteristic/data/device_data.dart'
    show DeviceData, DeviceDataType;
export 'src/ftms/characteristic/data/device_data_parameter.dart'
    show DeviceDataParameter;
export 'src/ftms/characteristic/data/device_data_parameter_value.dart'
    show DeviceDataParameterValue;
export 'src/ftms/characteristic/data/device_data_flag.dart' show DeviceDataFlag;
export 'src/ftms/characteristic/data/device_data_parameter_name.dart'
    show DeviceDataParameterName;

export 'src/ftms/characteristic/data/device/cross_trainer.dart'
    show CrossTrainer;
export 'src/ftms/characteristic/data/device/indoor_bike.dart' show IndoorBike;
export 'src/ftms/characteristic/data/device/treadmill.dart' show Treadmill;
export 'src/ftms/characteristic/data/device/rower.dart' show Rower;

export 'src/ftms/characteristic/machine/feature/machine_feature.dart'
    show MachineFeature;
export 'src/ftms/characteristic/machine/feature/machine_feature_flag.dart'
    show MachineFeatureFlag;

export 'src/ftms/characteristic/machine/status/machine_status.dart'
    show MachineStatus;
export 'src/ftms/characteristic/machine/status/machine_status_opcode.dart'
    show MachineStatusOpcode, MachineStatusOpcodeType;
export 'src/ftms/characteristic/machine/status/machine_status_parameter_value.dart'
    show MachineStatusParameterValue;

export 'src/ftms/characteristic/machine/control_point/machine_control_point.dart'
    show MachineControlPoint;
export 'src/ftms/characteristic/machine/control_point/machine_control_point_opcode.dart'
    show MachineControlPointOpcode, MachineControlPointOpcodeType;

export 'package:flutter_blue_plus/flutter_blue_plus.dart'
    show BluetoothDevice, BluetoothDeviceState, ScanResult;

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

  static Future<void> useDeviceDataCharacteristic(
      BluetoothDevice device, void Function(DeviceData) onData) async {
    var dataType = await getDeviceDataType(device);
    if (dataType == null) return;

    var service = await FTMSBluetooth.getFTMSService(device);
    if (service == null) return;

    await FTMSBluetooth.useDeviceDataCharacteristic(service, dataType, onData);
  }

  static Future<MachineFeature?> readMachineFeatureCharacteristic(
      BluetoothDevice device) async {
    var service = await FTMSBluetooth.getFTMSService(device);
    if (service == null) {
      print("No FTMS Service found!");
      return null;
    }

    return await FTMSBluetooth.readMachineFeatureCharacteristic(service);
  }

  static Future<void> useMachineStatusCharacteristic(
      BluetoothDevice device, void Function(MachineStatus) onData) async {
    var service = await FTMSBluetooth.getFTMSService(device);
    if (service == null) return;

    await FTMSBluetooth.useMachineStatusCharacteristic(service, onData);
  }

  static Future<void> writeMachineControlPointCharacteristic(
      BluetoothDevice device, MachineControlPoint controlPoint) async {
    var service = await FTMSBluetooth.getFTMSService(device);
    if (service == null) return;

    await FTMSBluetooth.writeMachineControlPointCharacteristic(
        service, controlPoint);
  }

  static Future<DeviceDataType?> getDeviceDataType(
      BluetoothDevice device) async {
    var service = await FTMSBluetooth.getFTMSService(device);
    if (service == null) {
      print("No FTMS Service found!");
      return null;
    }

    return FTMSBluetooth.getDeviceDataType(service);
  }

  static String convertDeviceDataTypeToString(DeviceDataType dataType) {
    switch (dataType) {
      case DeviceDataType.crossTrainer:
        return "Cross Trainer";
      case DeviceDataType.indoorBike:
        return "Indoor Bike";
      case DeviceDataType.treadmill:
        return "Treadmill";
      case DeviceDataType.rower:
        return "Rower";
    }

    // ignore: dead_code
    throw 'DeviceDataType $dataType does not exists';
  }
}
