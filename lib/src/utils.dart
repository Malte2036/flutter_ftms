import 'dart:typed_data';

import 'package:flutter_ftms/src/ftms/characteristic/parameter.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';

class Utils {
  static int intArrayToLittleEndian(List<int> byteArray) {
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

  static List<int> intToLittleEndianArray(int value, int length) {
    ByteData byteData = ByteData(length * 4);
    byteData.setInt32(0, value, Endian.little);
    List<int> byteArray = byteData.buffer.asUint8List();
    return List<int>.from(byteArray.getRange(0, length).toList().reversed);
  }

  static String dataToBinaryFlags(List<int> intArray, {int count = 2}) {
    Uint8List byteList =
        Uint8List.fromList(intArray.getRange(0, count).toList());
    ByteData byteData = ByteData.sublistView(byteList);
    var binary = byteData
        .getUint16(0, Endian.little)
        .toRadixString(2)
        .padLeft(count * 8, "0");
    return binary;
  }

  static int dataToFlags(List<int> intArray, {int count = 2}) {
    var binary = dataToBinaryFlags(intArray, count: count);
    //print(binary);
    return binaryToInt(binary);
  }

  static int binaryToInt(String binary) {
    return int.parse(binary, radix: 2);
  }

  static bool isNthBitSet(int x, int n) {
    return (x & (1 << n)) != 0;
  }

  static int readAndConvertLittleEndianValue(
      List<int> data, Parameter parameter) {
    var value = intArrayToLittleEndian(data);
    //print('value: $value');

    if (parameter.signed && ((value >> (parameter.size * 8 - 1)) & 1) == 1) {
      // Das Ergebnis ist negativ
      value = value - (1 << (parameter.size * 8));
    }
    return value;
  }

  static Map<Flag, bool> flagsToFeatureMap(
      List<int> data, int featureBitCount, List<Flag> allFeatureFlags) {
    var flags = dataToFlags(data, count: featureBitCount ~/ 8);

    Map<Flag, bool> featureMap = {};
    for (var i = 0; i < allFeatureFlags.length; i++) {
      var flag = allFeatureFlags[i];
      var isEnabled = isNthBitSet(flags, i);
      //if (isEnabled) print('${flag.name}: $isEnabled');

      featureMap.putIfAbsent(flag, () => isEnabled);
    }

    return featureMap;
  }
}
