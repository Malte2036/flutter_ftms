import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'flutter_ftms_test.mocks.dart';

// generate mock files: dart run build_runner build
@GenerateNiceMocks([
  MockSpec<BluetoothDevice>(),
  MockSpec<BluetoothService>(),
  MockSpec<BluetoothCharacteristic>(),
  MockSpec<CharacteristicProperties>(),
])
void main() {
  group("test useDeviceDataCharacteristic", () {
    test("test useDeviceDataCharacteristic without preferredDeviceDataType", () async {
      var device = MockBluetoothDevice();
      var service = MockBluetoothService();
      var char = MockBluetoothCharacteristic();
      var properties = MockCharacteristicProperties();

      when(device.discoverServices()).thenAnswer((_) => Future.value([service]));
      when(service.uuid).thenReturn(Guid("00001826-0000-1000-8000-00805f9b34fb"));
      when(service.characteristics).thenReturn([char]);

      // Mock feature characteristic for getDeviceDataType
      var featureChar = MockBluetoothCharacteristic();
      when(featureChar.uuid).thenReturn(Guid("00002ACC-0000-1000-8000-00805f9b34fb"));
      when(featureChar.properties).thenReturn(properties);
      when(properties.read).thenReturn(true);
      when(featureChar.read()).thenAnswer((_) => Future.value([1, 0])); // treadmill

      when(service.characteristics).thenReturn([featureChar, char]);

      // For data char
      when(char.uuid).thenReturn(Guid("00002ACD-0000-1000-8000-00805f9b34fb"));
      when(char.properties).thenReturn(properties);
      when(properties.notify).thenReturn(true);

      await FTMS.useDeviceDataCharacteristic(device, (data) {});

      // Verify that the service was discovered
      verify(device.discoverServices()).called(1);
      // Verify that the feature characteristic was read to determine device type
      verify(featureChar.read()).called(1);
    });

    test("test useDeviceDataCharacteristic with preferredDeviceDataType supported", () async {
      var device = MockBluetoothDevice();
      var service = MockBluetoothService();
      var char = MockBluetoothCharacteristic();
      var properties = MockCharacteristicProperties();

      when(device.discoverServices()).thenAnswer((_) => Future.value([service]));
      when(service.uuid).thenReturn(Guid("00001826-0000-1000-8000-00805f9b34fb"));
      when(service.characteristics).thenReturn([char]);

      // Data char for treadmill
      when(char.uuid).thenReturn(Guid("00002ACD-0000-1000-8000-00805f9b34fb"));
      when(char.properties).thenReturn(properties);
      when(properties.notify).thenReturn(true);

      await FTMS.useDeviceDataCharacteristic(device, (data) {}, preferredDeviceDataType: DeviceDataType.treadmill);

      // Verify that the service was discovered
      verify(device.discoverServices()).called(1);
      // Verify that setNotifyValue was called on the data characteristic
      verify(char.setNotifyValue(true)).called(1);
    });

    test("test useDeviceDataCharacteristic with preferredDeviceDataType not supported", () async {
      var device = MockBluetoothDevice();
      var service = MockBluetoothService();
      var properties = MockCharacteristicProperties();

      when(device.discoverServices()).thenAnswer((_) => Future.value([service]));
      when(service.uuid).thenReturn(Guid("00001826-0000-1000-8000-00805f9b34fb"));

      // Wrong char for checking preference
      var wrongChar = MockBluetoothCharacteristic();
      when(wrongChar.uuid).thenReturn(Guid("00009999-0000-1000-8000-00805f9b34fb"));

      // Mock feature for fallback
      var featureChar = MockBluetoothCharacteristic();
      when(featureChar.uuid).thenReturn(Guid("00002ACC-0000-1000-8000-00805f9b34fb"));
      when(featureChar.properties).thenReturn(properties);
      when(properties.read).thenReturn(true);
      when(featureChar.read()).thenAnswer((_) => Future.value([1, 0])); // treadmill

      var treadmillChar = MockBluetoothCharacteristic();
      when(treadmillChar.uuid).thenReturn(Guid("00002ACD-0000-1000-8000-00805f9b34fb"));
      when(treadmillChar.properties).thenReturn(properties);
      when(properties.notify).thenReturn(true);

      when(service.characteristics).thenReturn([featureChar, treadmillChar]);

      await FTMS.useDeviceDataCharacteristic(device, (data) {}, preferredDeviceDataType: DeviceDataType.indoorBike); // not supported, fallback to feature read

      // Verify that the service was discovered
      verify(device.discoverServices()).called(1);
      // Verify that the feature characteristic was read to determine device type (fallback)
      verify(featureChar.read()).called(1);
    });
  });
}