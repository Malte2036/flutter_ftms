import 'package:flutter_ftms/src/ftms/characteristic/data/device/rower.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_flag.dart';
import 'package:flutter_ftms/src/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<List<int>> data = [
    [
      126,
      25,
      0,
      39,
      0,
      214,
      156,
      0,
      0,
      0,
      0,
      97,
      0,
      0,
      0,
      228,
      0,
      13,
      0,
      0,
      0,
      0,
      36,
      0,
      0,
      0
    ]
  ];

  test('rower features', () {
    var d = data[0];

    var crossTrainer = Rower(d);

    var featureMap = crossTrainer.getFTMSDataFeatures();

    expect(featureMap[FTMSDataFlag.moreDataFlag], false);
    expect(featureMap[FTMSDataFlag.avgStrokeFlag], true);
    expect(featureMap[FTMSDataFlag.totalDistanceFlag], true);
    expect(featureMap[FTMSDataFlag.instPaceFlag], true);
    expect(featureMap[FTMSDataFlag.avgPaceFlag], true);
    expect(featureMap[FTMSDataFlag.instPowerFlag], true);
    expect(featureMap[FTMSDataFlag.avgPowerFlag], true);
    expect(featureMap[FTMSDataFlag.resistanceLevelFlag], false);
    expect(featureMap[FTMSDataFlag.expendedEnergyFlag], true);
    expect(featureMap[FTMSDataFlag.heartRateFlag], false);
    expect(featureMap[FTMSDataFlag.metabolicEquivalentFlag], false);
    expect(featureMap[FTMSDataFlag.elapsedTimeFlag], true);
    expect(featureMap[FTMSDataFlag.remainingTimeFlag], true);
  });

  test('rower parse correctly', () {
    var rower = Rower(data[0]);
    var parameterValues = rower.getFTMSDataParameterValues();

    expect(getParameterValueByName(parameterValues, "Stroke Rate").value, 0);
    expect(getParameterValueByName(parameterValues, "Stroke Count").value, 39);
    expect(
        getParameterValueByName(parameterValues, "Average Stroke Rate").value,
        214);
    expect(
        getParameterValueByName(parameterValues, "Total Distance").value, 156);
    expect(getParameterValueByName(parameterValues, "Instantaneous Pace").value,
        0);
    expect(getParameterValueByName(parameterValues, "Average Pace").value, 97);
    expect(
        getParameterValueByName(parameterValues, "Instantaneous Power").value,
        0);
    expect(
        getParameterValueByName(parameterValues, "Average Power").value, 228);
    expect(getParameterValueByName(parameterValues, "Total Energy").value, 13);
    expect(
        getParameterValueByName(parameterValues, "Energy Per Hour").value, 0);
    expect(
        getParameterValueByName(parameterValues, "Energy Per Minute").value, 0);
    expect(getParameterValueByName(parameterValues, "Elapsed Time").value, 36);
    expect(getParameterValueByName(parameterValues, "Remaining Time").value, 0);
  });
}
