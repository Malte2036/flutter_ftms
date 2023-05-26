import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms_bluetooth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test getDeviceDataTypeByBluetoothId", () {
    var res = FTMSBluetooth.getDeviceDataTypeByBluetoothId("22:22:A4:A6:02:00");
    expect(res, DeviceDataType.crossTrainer);
  });
}
