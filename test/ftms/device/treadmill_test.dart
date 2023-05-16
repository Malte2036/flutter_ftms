import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<List<int>> data = [
    [4, 8, 89, 1, 210, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  ];

  test('treadmill features', () {
    var d = data[0];

    var treadmill = Treadmill(d);

    var featureMap = treadmill.getFTMSDataFeatures();

    expect(featureMap[FTMSDataFlag.moreDataFlag], false);
    expect(featureMap[FTMSDataFlag.avgSpeedFlag], false);
    expect(featureMap[FTMSDataFlag.totalDistanceFlag], true);
    expect(featureMap[FTMSDataFlag.inclinationAndRampAngleFlag], false);
    expect(featureMap[FTMSDataFlag.elevationGainFlag], false);
    expect(featureMap[FTMSDataFlag.instPaceFlag], false);
    expect(featureMap[FTMSDataFlag.avgPaceFlag], false);
    expect(featureMap[FTMSDataFlag.expendedEnergyFlag], false);
    expect(featureMap[FTMSDataFlag.heartRateFlag], false);
    expect(featureMap[FTMSDataFlag.metabolicEquivalentFlag], false);
    expect(featureMap[FTMSDataFlag.elapsedTimeFlag], false);
    expect(featureMap[FTMSDataFlag.remainingTimeFlag], true);
    expect(featureMap[FTMSDataFlag.forceOnBeltAndPowerOutputFlag], false);
  });

  test('treadmill parse correctly', () {
    var treadmill = Treadmill(data[0]);

    expect(
        treadmill
            .getParameterValueByName(FTMSDataParameterName.instSpeed)!
            .value,
        345);
    expect(
        treadmill
            .getParameterValueByName(FTMSDataParameterName.totalDistance)!
            .value,
        1234);
    expect(
        treadmill
            .getParameterValueByName(FTMSDataParameterName.remainingTime)!
            .value,
        100);
  });
}
