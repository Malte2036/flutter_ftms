import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms_bluetooth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'ftms_bluetooth_test.mocks.dart';

// generate mock files: dart run build_runner build
@GenerateMocks([BluetoothDevice, BluetoothService, BluetoothCharacteristic])
void main() {
  group("test getDeviceDataTypeByBluetoothId", () {
    test("test getDeviceDataTypeByBluetoothId with treadmill mac address", () {
      var res =
          FTMSBluetooth.getDeviceDataTypeByBluetoothId("22:22:A4:A6:02:00");
      expect(res, DeviceDataType.crossTrainer);
    });

    test("test getDeviceDataTypeByBluetoothId with unkown mac address", () {
      var res =
          FTMSBluetooth.getDeviceDataTypeByBluetoothId("22:22:A4:A6:00:00");
      expect(res, null);
    });

    test("test getDeviceDataTypeByBluetoothId with invalid mac address", () {
      var res = FTMSBluetooth.getDeviceDataTypeByBluetoothId("invalid");
      expect(res, null);
    });

    // see https://github.com/Malte2036/flutter_ftms/issues/14
    test("test getDeviceDataTypeByBluetoothId with anonymous ios uuid", () {
      var res = FTMSBluetooth.getDeviceDataTypeByBluetoothId(
          "6920a902-ba0e-4a13-a35f-6bc91161c517");
      expect(res, null);
    });
  });

  group("test getFTMSService", () {
    test("test getFTMSService is FTMSDevice", () async {
      var device = MockBluetoothDevice();
      var service = MockBluetoothService();
      when(service.uuid)
          .thenReturn(Guid("00001826-0000-1000-8000-00805f9b34fb"));

      when(device.discoverServices())
          .thenAnswer((_) => Future.value([service]));

      var res = await FTMSBluetooth.getFTMSService(device);
      expect(res, service);
    });

    test("test getFTMSService is not FTMSDevice", () async {
      var device = MockBluetoothDevice();
      var service = MockBluetoothService();
      when(service.uuid)
          .thenReturn(Guid("00001234-0000-0000-0000-000000000000"));

      when(device.discoverServices())
          .thenAnswer((_) => Future.value([service]));

      var res = await FTMSBluetooth.getFTMSService(device);
      expect(res, null);
    });
  });

  group("test characteristicStartWith", () {
    test("test characteristicStartWith with right uuid", () {
      var char = MockBluetoothCharacteristic();
      when(char.uuid).thenReturn(Guid("00005678-0000-0000-0000-000000000000"));

      var res = FTMSBluetooth.characteristicStartWith(char, "00005678");
      expect(res, true);
    });

    test("test characteristicStartWith with wrong uuid", () {
      var char = MockBluetoothCharacteristic();
      when(char.uuid).thenReturn(Guid("00005678-0000-0000-0000-000000000000"));

      var res = FTMSBluetooth.characteristicStartWith(char, "00009999");
      expect(res, false);
    });
  });
}
