import 'dart:typed_data';

import 'package:flutter_ftms/src/ftms/ftms_patameter.dart';
import 'package:flutter_ftms/src/utils.dart';

abstract class FTMSData {
  final List<int> ftmsData;
  late final List<FTMSDataParameterValue> parameterValues;

  List<String> get allFTMSDataFlags;
  List<FTMSDataParameter> get allFTMSDataParameters;

  FTMSData(this.ftmsData) {
    var features = getFTMSDataFeatures();
    var parameterValues = List<FTMSDataParameterValue>.empty(growable: true);

    print("---------------");

    var dataIndex = 2;
    var flagIndex = 0;
    while (dataIndex < ftmsData.length && flagIndex < features.length) {
      var flag = features.entries.elementAt(flagIndex);
      if (flag.value == true) {
        var parameters = allFTMSDataParameters
            .where((parameter) => parameter.flagName == flag.key)
            .toList();

        if (parameters.length == 0) print('empty: ${flag.key}');

        for (var parameter in parameters) {
          var value = 0;
          try {
            var d = ftmsData
                .getRange(dataIndex, dataIndex + parameter.size)
                .toList();
            print(d);
            value = intArrayToLittleEndian(d);
          } catch (e) {
            value = -1;
          }
          if (parameter.signed &&
              ((value >> (parameter.size * 8 - 1)) & 1) == 1) {
            // Das Ergebnis ist negativ
            value = value - (1 << (parameter.size * 8));
          }
          print(
              '${parameter.name}: ${value} [${(value * parameter.factor).toInt()}${parameter.unit}]');

          dataIndex += parameter.size;

          parameterValues.add(parameter.toFTMSDataParameterValue(value));
        }
      }
      flagIndex++;
    }
    this.parameterValues = parameterValues;
    print('flagIndex $flagIndex and ftmsData.length ${ftmsData.length}');
  }

  String _getFlagsBinary() {
    Uint8List byteList = Uint8List.fromList(
        List.from(ftmsData.getRange(0, 2).toList().reversed));
    ByteData byteData = ByteData.sublistView(byteList);
    var binary =
        byteData.getUint16(0, Endian.little).toRadixString(2).padLeft(16, "0");
    return binary;
  }

  Map<String, bool> getFTMSDataFeatures() {
    var flagsBinary = _getFlagsBinary();
    //print(flagsBinary);

    Map<String, bool> featureMap = {};

    for (var i = 0; i < flagsBinary.length; i++) {
      var flag = allFTMSDataFlags[i];
      var isEnabled = flagsBinary[flagsBinary.length - 1 - i] == "1";
      //print('$flag: $isEnabled');

      featureMap.putIfAbsent(flag, () => isEnabled);
    }
    return featureMap;
  }

  List<FTMSDataParameterValue> getFTMSDataParameterValues() {
    return parameterValues;
  }
}
