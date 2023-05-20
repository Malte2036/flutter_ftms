import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<List<int>> data = [
    [4, 8, 89, 1, 210, 4, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  ];

  test('treadmill features', () {
    var d = data[0];

    var treadmill = Treadmill(d);

    var featureMap = treadmill.getDeviceDataFeatures();

    expect(featureMap[DeviceDataFlag.moreDataFlag], false);
    expect(featureMap[DeviceDataFlag.avgSpeedFlag], false);
    expect(featureMap[DeviceDataFlag.totalDistanceFlag], true);
    expect(featureMap[DeviceDataFlag.inclinationAndRampAngleFlag], false);
    expect(featureMap[DeviceDataFlag.elevationGainFlag], false);
    expect(featureMap[DeviceDataFlag.instPaceFlag], false);
    expect(featureMap[DeviceDataFlag.avgPaceFlag], false);
    expect(featureMap[DeviceDataFlag.expendedEnergyFlag], false);
    expect(featureMap[DeviceDataFlag.heartRateFlag], false);
    expect(featureMap[DeviceDataFlag.metabolicEquivalentFlag], false);
    expect(featureMap[DeviceDataFlag.elapsedTimeFlag], false);
    expect(featureMap[DeviceDataFlag.remainingTimeFlag], true);
    expect(featureMap[DeviceDataFlag.forceOnBeltAndPowerOutputFlag], false);
  });

  test('treadmill parse correctly', () {
    var treadmill = Treadmill(data[0]);

    expect(
        treadmill
            .getParameterValueByName(DeviceDataParameterName.instSpeed)!
            .value,
        345);
    expect(
        treadmill
            .getParameterValueByName(DeviceDataParameterName.totalDistance)!
            .value,
        1234);
    expect(
        treadmill
            .getParameterValueByName(DeviceDataParameterName.remainingTime)!
            .value,
        100);
  });
}
