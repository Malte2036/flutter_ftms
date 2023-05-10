import 'dart:typed_data';

import 'package:flutter_ftms/src/ftms/ftms_patameter.dart';
import 'package:flutter_ftms/src/utils.dart';

abstract class FTMSData {
  final List<int> ftmsData;
  late final parameterValues =
      List<FTMSDataParameterValue>.empty(growable: true);

  List<String> get allFTMSDataFlags;
  List<FTMSDataParameter> get allFTMSDataParameters;

  FTMSData(this.ftmsData) {
    var features = getFTMSDataFeatures();

    int ftmsDataOffset = 2;
    for (var dataParameter in allFTMSDataParameters) {
      var parameterIsEnabled = dataParameter.flagName.isEmpty ||
          features[dataParameter.flagName] == true;

      if (parameterIsEnabled) {
        List<int> data;
        try {
          data = ftmsData
              .getRange(ftmsDataOffset, ftmsDataOffset + dataParameter.size)
              .toList();
        } catch (e) {
          print('Data is missing!');
          break;
        }

        var value = readAndConvertLittleEndianValue(data, dataParameter);
        //print(
        //    '${dataParameter.name}: ${value} [${(value * dataParameter.factor).toInt()}${dataParameter.unit}]');

        ftmsDataOffset += dataParameter.size;

        parameterValues.add(dataParameter.toFTMSDataParameterValue(value));
      }
    }
  }

  int _getFlags() {
    return dataToFlags(ftmsData);
  }

  Map<String, bool> getFTMSDataFeatures() {
    var flags = _getFlags();

    Map<String, bool> featureMap = {};

    for (var i = 0; i < allFTMSDataFlags.length; i++) {
      var flag = allFTMSDataFlags[i];
      var isEnabled = isNthBitSet(flags, i);
      //if (isEnabled) print('$flag: $isEnabled');

      featureMap.putIfAbsent(flag, () => isEnabled);
    }
    return featureMap;
  }

  List<FTMSDataParameterValue> getFTMSDataParameterValues() {
    return parameterValues;
  }
}
