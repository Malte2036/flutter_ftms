import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_parameter.dart';
import 'package:flutter_ftms/src/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("dataToBinaryFlags", () {
    expect(dataToBinaryFlags([68, 0]), ("1000100".padLeft(16, "0")));
  });

  test("intArrayToLittleEndian", () {
    expect(intArrayToLittleEndian([78]), 78);
    expect(intArrayToLittleEndian([0, 23]), 23);
    expect(intArrayToLittleEndian([0, 255]), 255);
    expect(intArrayToLittleEndian([1, 0]), 256);
    expect(intArrayToLittleEndian([12, 0]), 3072);
    expect(intArrayToLittleEndian([1, 1]), 257);
    expect(intArrayToLittleEndian([255, 255]), 65535);
    expect(intArrayToLittleEndian([1, 0, 0]), 65536);
    expect(intArrayToLittleEndian([255, 255, 255]), 16777215);
    expect(intArrayToLittleEndian([4, 1]), 1025);
    expect(intArrayToLittleEndian([1, 83]), 339);
  });

  test("readAndConvertLittleEndianValue", () {
    const parameterNotSigned =
        FTMSDataParameter("test", null, 1, "", 0, signed: false);
    expect(readAndConvertLittleEndianValue([92], parameterNotSigned), 92);

    const parameterSigned =
        FTMSDataParameter("test", null, 1, "", 0, signed: true);
    expect(readAndConvertLittleEndianValue([-92], parameterSigned), -92);
  });
}
