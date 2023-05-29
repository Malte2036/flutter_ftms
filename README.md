# FTMS Flutter Plugin

This Flutter package allows you to connect to FTMS (Fitness Machine Service) devices via Bluetooth Low Energy (BLE). It provides functions for scanning for available devices, connecting to a specific device, and reading data and status information from the device.

## Supported Devices

| Device        | Implemented?         |
| ------------- | -------------------- |
| Treadmill     | ✅ (implemented)     |
| Cross Trainer | ✅ (implemented)     |
| Step Climber  | ❌ (not implemented) |
| Stair Climber | ❌ (not implemented) |
| Rower         | ✅ (implemented)     |
| Indoor Bike   | ✅ (implemented)     |

## Supported Characteristics

| Characteristic                    | Functions                                                                                          | Device Type                                                                             | Description                                                     | Implemented?     |
| --------------------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------- | ---------------- |
| DeviceDataCharacteristic          | `useDeviceDataCharacteristic(BluetoothDevice device, void Function(DeviceData) onData)`            | Treadmill, cross trainer, step climber, stair climber, rower and indoor bike            | Reports real-time workout data.                                 | ✅ (implemented) |
| MachineFeatureCharacteristic      | `readMachineFeatureCharacteristic(BluetoothDevice device)`                                         | Treadmill, cross trainer, step climber, stair climber, rower and indoor bike            | Describes the capabilities supported by the device.             | ✅ (implemented) |
| MachineStatusCharacteristic       | `useMachineStatusCharacteristic(BluetoothDevice device, void Function(MachineStatus) onData)`      | Treadmill, cross trainer, step climber, stair climber, rower and indoor bike            | Reports the device status data.                                 | ✅ (implemented) |
| MachineControlPointCharacteristic | `writeMachineControlPointCharacteristic(BluetoothDevice device, MachineControlPoint controlPoint)` | Optional support for treadmills. Mandatory for cross trainers, rowers, and indoor bikes | Controls the status (paused or resumed) of the fitness machine. | ✅ (implemented) |

## Installation

To use the FTMS Flutter Plugin, you need to follow the "Getting Started" guide for `flutter_blue_plus`, as this package is based on it.
You can find the guide here: https://pub.dev/packages/flutter_blue_plus#getting-started

You don't need to manually install the `flutter_blue_plus` package as it is included as a dependency of `flutter_ftms`.

After completing the `flutter_blue_plus` setup, you can add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_ftms: 0.7.0
```

Then, run `flutter pub get` to install the package.

## Usage

Import the `flutter_ftms` package and use the `FTMS` class to interact with FTMS devices.

### Scanning for devices

You can scan for available FTMS devices using the `scanForBluetoothDevices()` function. This will start a scan and return a stream of `ScanResult` objects.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

await FTMS.scanForBluetoothDevices();
Stream<List<ScanResult>> scanResults = FTMS.scanResults;
```

### Connecting to a device

Once you have a `BluetoothDevice` object, you can connect to it using the `connectToFTMSDevice()` function.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
await FTMS.connectToFTMSDevice(device);
```

### Checking device type

You can check if a given Bluetooth device is an FTMS device using the `isBluetoothDeviceFTMSDevice()` function. This function returns a bool indicating whether or not the device supports the FTMS service.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
bool isFTMSDevice = await FTMS.isBluetoothDeviceFTMSDevice(device);
```

### Getting device type

You can get the FTMS data type of a connected device using the `getDeviceDataType()` function. This function returns a `DeviceDataType` enum value indicating whether the device is an indoor bike, cross trainer, treadmill, or rower.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
DeviceDataType? dataType = await FTMS.getDeviceDataType(device);
if (dataType != null) {
    String deviceTypeString = FTMS.convertDeviceDataTypeToString(dataType);
    // handle device type
}
```

### Reading data from a device

You can read data from an FTMS device using the `useDeviceDataCharacteristic()` function. This function takes a callback that will be called with a `DeviceData` object every time new data is received from the device.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
await FTMS.useDeviceDataCharacteristic(device, (DeviceData data) {
    // handle new data
});
```

### Reading machine feature information from a device

You can read machine feature information from an FTMS device using the `readMachineFeatureCharacteristic()` function. This function takes a `BluetoothDevice` object and returns a `MachineFeature` object.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
MachineFeature? feature = await FTMS.readMachineFeatureCharacteristic(device);
if (feature != null) {
    // handle feature object
}

```

### Reading machine status information from a device

You can read the machine status from an FTMS device using the `useMachineStatusCharacteristic()` function. This function takes a callback that will be called with a `MachineStatus` object every time a new status is received from the device.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
await FTMS.useMachineStatusCharacteristic(device, (MachineStatus status) {
    // handle new machine status
});

```

### Writing machine control point characteristic

You can write to the machine control point characteristic of an FTMS device using the `writeMachineControlPointCharacteristic()` function. This function takes a `BluetoothDevice` object and a `MachineControlPoint` object as parameters.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
MachineControlPoint controlPoint = // create a MachineControlPoint object
await FTMS.writeMachineControlPointCharacteristic(device, controlPoint);

```
