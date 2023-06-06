import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/parameter_name.dart';
import 'package:flutter_ftms/src/utils.dart';

enum DeviceDataType { crossTrainer, indoorBike, treadmill, rower }

abstract class DeviceData {
  late final List<int> _deviceData;
  late final _parameterValues =
      List<DeviceDataParameterValue>.empty(growable: true);

  DeviceDataType get deviceDataType;

  List<Flag> get allDeviceDataFlags;
  List<DeviceDataParameter> get allDeviceDataParameters;

  static const _featureBitSize = 16;

  DeviceData(this._deviceData) {
    var features = getDeviceDataFeatures();

    int ftmsDataOffset = 2;
    for (var dataParameter in allDeviceDataParameters) {
      if (dataParameter.flag == null) {
        //print("DataParameter ${dataParameter.name.name} is placeholder");
        ftmsDataOffset += dataParameter.size;
        continue;
      }

      if (dataParameter.flag == DeviceDataFlag.moreDataFlag &&
          features[DeviceDataFlag.moreDataFlag] == true) {
        //print('Skipping ${dataParameter.name.name}. Should be in the next data package.');
        continue;
      }

      var parameterIsEnabled = features[dataParameter.flag] == true;
      if (dataParameter.flag == DeviceDataFlag.moreDataFlag) {
        parameterIsEnabled = !parameterIsEnabled;
      }

      if (parameterIsEnabled) {
        List<int> data;
        try {
          data = _deviceData
              .getRange(ftmsDataOffset, ftmsDataOffset + dataParameter.size)
              .toList();

          data = List<int>.from(data.reversed);
        } catch (e) {
          //print('Data is missing!');
          break;
        }

        var value = Utils.readAndConvertLittleEndianValue(data, dataParameter);
        //print(
        //    '${dataParameter.name}: ${value} [${(value * dataParameter.factor).toInt()}${dataParameter.unit}]');

        ftmsDataOffset += dataParameter.size;

        _parameterValues.add(dataParameter.toDeviceDataParameterValue(value));
      }
    }
  }

  merge(DeviceData other) {
    _parameterValues.addAll(other._parameterValues);
  }

  Map<Flag, bool> getDeviceDataFeatures() {
    return Utils.flagsToFeatureMap(
        _deviceData, _featureBitSize, allDeviceDataFlags);
  }

  List<DeviceDataParameterValue> getDeviceDataParameterValues() {
    return _parameterValues;
  }

  DeviceDataParameterValue? getParameterValueByName(ParameterName name) {
    try {
      return _parameterValues.firstWhere((parameter) => parameter.name == name);
    } catch (e) {
      print('ParameterValue $name not found!');
      return null;
    }
  }
}
