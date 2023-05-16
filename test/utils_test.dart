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

  test("readAndConvertLittleEndianValue", () {
    const parameterNotSigned = FTMSDataParameter(
        FTMSDataParameterName.instSpeed, null, 1, "", 0,
        signed: false);
    expect(Utils.readAndConvertLittleEndianValue([92], parameterNotSigned), 92);

    const parameterSigned = FTMSDataParameter(
        FTMSDataParameterName.instSpeed, null, 1, "", 0,
        signed: true);
    expect(Utils.readAndConvertLittleEndianValue([-92], parameterSigned), -92);
  });
}
