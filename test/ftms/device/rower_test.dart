import 'package:flutter_ftms/flutter_ftms.dart';
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

    var rower = Rower(d);

    var featureMap = rower.getFTMSDataFeatures();

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

    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.strokeRate)
            .value,
        0);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.strokeCount)
            .value,
        39);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.avgStrokeRate)
            .value,
        214);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.totalDistance)
            .value,
        156);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.instPace)
            .value,
        0);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.avgPace)
            .value,
        97);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.instPower)
            .value,
        0);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.avgPower)
            .value,
        228);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.totalEnergy)
            .value,
        13);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.energyPerHour)
            .value,
        0);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.energyPerMinute)
            .value,
        0);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.elapsedTime)
            .value,
        36);
    expect(
        Utils.getParameterValueByName(
                parameterValues, FTMSDataParameterName.remainingTime)
            .value,
        0);
  });
}
