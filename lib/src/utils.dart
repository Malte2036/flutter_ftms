import 'dart:typed_data';

import 'package:flutter_ftms/src/ftms/ftms_patameter.dart';

int intArrayToLittleEndian(List<int> byteArray) {
  List<int> filledByteArray = [
    ...List.filled(4 - byteArray.length, 0),
    ...byteArray
  ];
  List<int> reversedByteArray = List<int>.from(filledByteArray.reversed);
  ByteData byteData =
      ByteData.sublistView(Uint8List.fromList(reversedByteArray));
  int intValue = byteData.getInt32(0, Endian.little);
  return intValue;
}

String dataToBinaryFlags(intArray) {
  Uint8List byteList = Uint8List.fromList(intArray.getRange(0, 2).toList());
  ByteData byteData = ByteData.sublistView(byteList);
  var binary =
      byteData.getUint16(0, Endian.little).toRadixString(2).padLeft(16, "0");
  return binary;
}

int dataToFlags(intArray) {
  var binary = dataToBinaryFlags(intArray);
  print(binary);
  return binaryToInt(binary);
}

int binaryToInt(String binary) {
  return int.parse(binary, radix: 2);
}

bool isNthBitSet(int x, int n) {
  return (x & (1 << n)) != 0;
}

int readAndConvertLittleEndianValue(
    List<int> data, FTMSDataParameter dataParameter) {
  print(data);
  var reversedData = List<int>.from(data.reversed);

  var value = intArrayToLittleEndian(reversedData);
  print('value: $value');

  if (dataParameter.signed &&
      ((value >> (dataParameter.size * 8 - 1)) & 1) == 1) {
    // Das Ergebnis ist negativ
    value = value - (1 << (dataParameter.size * 8));
  }
  return value;
}
