import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("dataToBinaryFlags", () {
    expect(Utils.dataToBinaryFlags([68, 0]), ("1000100".padLeft(16, "0")));
  });

  test("intArrayToLittleEndian", () {
    expect(Utils.intArrayToLittleEndian([78]), 78);
    expect(Utils.intArrayToLittleEndian([0, 23]), 23);
    expect(Utils.intArrayToLittleEndian([0, 255]), 255);
    expect(Utils.intArrayToLittleEndian([1, 0]), 256);
    expect(Utils.intArrayToLittleEndian([12, 0]), 3072);
    expect(Utils.intArrayToLittleEndian([1, 1]), 257);
    expect(Utils.intArrayToLittleEndian([255, 255]), 65535);
    expect(Utils.intArrayToLittleEndian([1, 0, 0]), 65536);
    expect(Utils.intArrayToLittleEndian([255, 255, 255]), 16777215);
    expect(Utils.intArrayToLittleEndian([4, 1]), 1025);
    expect(Utils.intArrayToLittleEndian([1, 83]), 339);
  });

  test("intToLittleEndianArray", () {
    expect(Utils.intToLittleEndianArray(78, 1), [78]);
    expect(Utils.intToLittleEndianArray(23, 2), [0, 23]);
    expect(Utils.intToLittleEndianArray(255, 2), [0, 255]);
    expect(Utils.intToLittleEndianArray(256, 2), [1, 0]);
    expect(Utils.intToLittleEndianArray(3072, 2), [12, 0]);
    expect(Utils.intToLittleEndianArray(257, 2), [1, 1]);
    expect(Utils.intToLittleEndianArray(65535, 2), [255, 255]);
    expect(Utils.intToLittleEndianArray(65536, 3), [1, 0, 0]);
    expect(Utils.intToLittleEndianArray(16777215, 3), [255, 255, 255]);
    expect(Utils.intToLittleEndianArray(1025, 2), [4, 1]);
    expect(Utils.intToLittleEndianArray(339, 2), [1, 83]);
  });

  test("readAndConvertLittleEndianValue", () {
    const parameterNotSigned = DeviceDataParameter(
        DeviceDataParameterName.instSpeed, null, 1, "", 0,
        signed: false);
    expect(Utils.readAndConvertLittleEndianValue([92], parameterNotSigned), 92);

    const parameterSigned = DeviceDataParameter(
        DeviceDataParameterName.instSpeed, null, 1, "", 0,
        signed: true);
    expect(Utils.readAndConvertLittleEndianValue([-92], parameterSigned), -92);
  });
}
