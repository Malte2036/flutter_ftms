# FTMS Flutter Plugin

This Flutter package allows you to connect to FTMS (Fitness Machine Service) devices via Bluetooth Low Energy (BLE). It provides functions for scanning for available devices, connecting to a specific device, and reading data and status information from the device.

⚠️ _**This Flutter package is currently under development.**_ ⚠️

## Supported Devices

| Device        | Implemented?           |
| ------------- | ---------------------- |
| Indoor Bike   | ✅ (implemented)       |
| Cross Trainer | 🚧 (under development) |

## Installation

To use the FTMS Flutter Plugin, you need to follow the "Getting Started" guide for `flutter_blue_plus`, as this package is based on it.
You can find the guide here: https://pub.dev/packages/flutter_blue_plus#getting-started

You don't need to manually install the `flutter_blue_plus` package as it is included as a dependency of `flutter_ftms`.

After completing the `flutter_blue_plus` setup, you can add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_ftms: 0.1.3
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

### Checking device type

You can check if a given Bluetooth device is an FTMS device using the `isBluetoothDeviceFTMSDevice()` function. This function returns a bool indicating whether or not the device supports the FTMS service.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
bool isFTMSDevice = await FTMS.isBluetoothDeviceFTMSDevice(device);
```

### Connecting to a device

Once you have a `BluetoothDevice` object, you can connect to it using the `connectToFTMSDevice()` function.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
await FTMS.connectToFTMSDevice(device);
```

### Getting device type

You can get the FTMS data type of a connected device using the `getFTMSDeviceType()` function. This function returns an `FTMSDataType` enum value indicating whether the device is an indoor bike or cross trainer.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
FTMSDataType? dataType = await FTMS.getFTMSDeviceType(device);
if (dataType != null) {
    String deviceTypeString = FTMS.convertFTMSDataTypeToString(dataType);
    // handle device type
}
```

### Reading data from a device

You can read data from an FTMS device using the `useDataCharacteristic()` function. This function takes a callback that will be called with an `FTMSData` object every time new data is received from the device.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
await FTMS.useDataCharacteristic(device, (FTMSData data) {
    // handle new data
});
```

### Reading feature information from a device

You can read feature information from an FTMS device using the `readFeatureCharacteristic()` function.

```dart
import 'package:flutter_ftms/flutter_ftms.dart';

BluetoothDevice device = // obtain a BluetoothDevice object
FTMSFeature? feature = await FTMS.readFeatureCharacteristic(device);
if (feature != null) {
    // handle feature object
}
```
