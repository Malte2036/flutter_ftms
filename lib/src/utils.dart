import 'dart:typed_data';

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
