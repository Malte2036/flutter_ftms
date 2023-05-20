import 'package:flutter_ftms/flutter_ftms.dart';
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

    var featureMap = rower.getDeviceDataFeatures();

    expect(featureMap[DeviceDataFlag.moreDataFlag], false);
    expect(featureMap[DeviceDataFlag.avgStrokeFlag], true);
    expect(featureMap[DeviceDataFlag.totalDistanceFlag], true);
    expect(featureMap[DeviceDataFlag.instPaceFlag], true);
    expect(featureMap[DeviceDataFlag.avgPaceFlag], true);
    expect(featureMap[DeviceDataFlag.instPowerFlag], true);
    expect(featureMap[DeviceDataFlag.avgPowerFlag], true);
    expect(featureMap[DeviceDataFlag.resistanceLevelFlag], false);
    expect(featureMap[DeviceDataFlag.expendedEnergyFlag], true);
    expect(featureMap[DeviceDataFlag.heartRateFlag], false);
    expect(featureMap[DeviceDataFlag.metabolicEquivalentFlag], false);
    expect(featureMap[DeviceDataFlag.elapsedTimeFlag], true);
    expect(featureMap[DeviceDataFlag.remainingTimeFlag], true);
  });

  test('rower parse correctly', () {
    var rower = Rower(data[0]);

    expect(
        rower
            .getParameterValueByName(DeviceDataParameterName.strokeRate)!
            .value,
        0);
    expect(
        rower
            .getParameterValueByName(DeviceDataParameterName.strokeCount)!
            .value,
        39);
    expect(
        rower
            .getParameterValueByName(DeviceDataParameterName.avgStrokeRate)!
            .value,
        214);
    expect(
        rower
            .getParameterValueByName(DeviceDataParameterName.totalDistance)!
            .value,
        156);
    expect(
        rower.getParameterValueByName(DeviceDataParameterName.instPace)!.value,
        0);
    expect(
        rower.getParameterValueByName(DeviceDataParameterName.avgPace)!.value,
        97);
    expect(
        rower.getParameterValueByName(DeviceDataParameterName.instPower)!.value,
        0);
    expect(
        rower.getParameterValueByName(DeviceDataParameterName.avgPower)!.value,
        228);
    expect(
        rower
            .getParameterValueByName(DeviceDataParameterName.totalEnergy)!
            .value,
        13);
    expect(
        rower
            .getParameterValueByName(DeviceDataParameterName.energyPerHour)!
            .value,
        0);
    expect(
        rower
            .getParameterValueByName(DeviceDataParameterName.energyPerMinute)!
            .value,
        0);
    expect(
        rower
            .getParameterValueByName(DeviceDataParameterName.elapsedTime)!
            .value,
        36);
    expect(
        rower
            .getParameterValueByName(DeviceDataParameterName.remainingTime)!
            .value,
        0);
  });
}
