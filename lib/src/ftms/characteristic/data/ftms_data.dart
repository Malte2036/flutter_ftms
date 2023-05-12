import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/utils.dart';

enum FTMSDataType { crossTrainer, indoorBike, treadmill }

abstract class FTMSData {
  final List<int> ftmsData;
  late final parameterValues =
      List<FTMSDataParameterValue>.empty(growable: true);

  FTMSDataType get ftmsDataType;

  List<Flag> get allFTMSDataFlags;
  List<FTMSDataParameter> get allFTMSDataParameters;

  static const _featureBitSize = 16;

  FTMSData(this.ftmsData) {
    var features = getFTMSDataFeatures();

    int ftmsDataOffset = 2;
    for (var dataParameter in allFTMSDataParameters) {
      var parameterIsEnabled =
          dataParameter.flag == null || features[dataParameter.flag] == true;

      if (parameterIsEnabled) {
        List<int> data;
        try {
          data = ftmsData
              .getRange(ftmsDataOffset, ftmsDataOffset + dataParameter.size)
              .toList();

          // WHY?
          if (ftmsDataType != FTMSDataType.crossTrainer) {
            data = List<int>.from(data.reversed);
          }

          //if (dataParameter.name == "Total Distance") print(data);
        } catch (e) {
          //print('Data is missing!');
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

  Map<Flag, bool> getFTMSDataFeatures() {
    return flagsToFeatureMap(ftmsData, _featureBitSize, allFTMSDataFlags);
  }

  List<FTMSDataParameterValue> getFTMSDataParameterValues() {
    return parameterValues;
  }
}
