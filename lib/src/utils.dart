import 'dart:typed_data';

import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_parameter.dart';

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

String dataToBinaryFlags(intArray, {int count = 2}) {
  Uint8List byteList = Uint8List.fromList(intArray.getRange(0, count).toList());
  ByteData byteData = ByteData.sublistView(byteList);
  var binary = byteData
      .getUint16(0, Endian.little)
      .toRadixString(2)
      .padLeft(count * 8, "0");
  return binary;
}

int dataToFlags(intArray, {int count = 2}) {
  var binary = dataToBinaryFlags(intArray, count: count);
  //print(binary);
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
  var value = intArrayToLittleEndian(data);
  //print('value: $value');

  if (dataParameter.signed &&
      ((value >> (dataParameter.size * 8 - 1)) & 1) == 1) {
    // Das Ergebnis ist negativ
    value = value - (1 << (dataParameter.size * 8));
  }
  return value;
}

Map<Flag, bool> flagsToFeatureMap(
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

FTMSDataParameterValue getParameterValueByName(
    List<FTMSDataParameterValue> parameterValues, String name) {
  try {
    return parameterValues.firstWhere((parameter) => parameter.name == name);
  } catch (e) {
    throw 'ParameterValue $name not found!';
  }
}
