import 'package:flutter/foundation.dart';
import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const List<List<int>> data = [
    [158, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 140, 0, 0, 0, 0, 0],
    [158, 119, 0, 236, 0, 0, 0, 0, 0, 0, 38, 0, 0, 0, 140, 0, 0, 0, 9, 0],
    [158, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 140, 0, 0, 0, 0, 0],
    [158, 119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0],
    [158, 119, 0, 241, 1, 0, 0, 0, 0, 0, 78, 0, 0, 0, 0, 0, 10, 0, 24, 0],
    [158, 119, 0, 241, 1, 83, 0, 1, 0, 0, 78, 0, 12, 0, 10, 0, 10, 0, 24, 0],
    [158, 119, 0, 228, 1, 140, 0, 2, 0, 0, 76, 0, 22, 0, 20, 0, 10, 0, 23, 0],
    [158, 119, 0, 228, 1, 183, 0, 4, 0, 0, 76, 0, 28, 0, 30, 0, 10, 0, 23, 0],
    [158, 119, 0, 255, 1, 219, 0, 5, 0, 0, 80, 0, 34, 0, 50, 0, 10, 0, 25, 0],
    [158, 119, 0, 24, 2, 251, 0, 6, 0, 0, 84, 0, 38, 0, 60, 0, 10, 0, 26, 0],
    [158, 119, 0, 38, 2, 22, 1, 8, 0, 0, 86, 0, 42, 0, 80, 0, 10, 0, 27, 0],
    [158, 119, 0, 38, 2, 45, 1, 10, 0, 0, 86, 0, 46, 0, 90, 0, 10, 0, 27, 0],
    [158, 119, 0, 38, 2, 64, 1, 11, 0, 0, 86, 0, 50, 0, 100, 0, 10, 0, 27, 0],
    [158, 119, 0, 38, 2, 80, 1, 13, 0, 0, 86, 0, 52, 0, 120, 0, 10, 0, 27, 0],
    [158, 119, 0, 38, 2, 95, 1, 14, 0, 0, 86, 0, 54, 0, 130, 0, 10, 0, 27, 0],
    [158, 119, 0, 38, 2, 107, 1, 16, 0, 0, 86, 0, 56, 0, 150, 0, 10, 0, 27, 0],
    [158, 119, 0, 38, 2, 118, 1, 17, 0, 0, 86, 0, 58, 0, 160, 0, 10, 0, 27, 0],
    [158, 119, 0, 38, 2, 128, 1, 19, 0, 0, 86, 0, 60, 0, 180, 0, 10, 0, 27, 0],
    [158, 119, 0, 38, 2, 137, 1, 20, 0, 0, 86, 0, 60, 0, 190, 0, 10, 0, 27, 0],
    [158, 119, 0, 0, 0, 117, 1, 20, 0, 0, 0, 0, 58, 0, 190, 0, 10, 0, 0, 0],
    [158, 119, 0, 0, 0, 99, 1, 20, 0, 0, 0, 0, 54, 0, 190, 0, 10, 0, 0, 0],
    [158, 119, 0, 0, 0, 83, 1, 20, 0, 0, 0, 0, 52, 0, 190, 0, 10, 0, 0, 0],
    [158, 119, 0, 0, 0, 68, 1, 20, 0, 0, 0, 0, 50, 0, 190, 0, 10, 0, 0, 0],
    [158, 119, 0, 0, 0, 55, 1, 20, 0, 0, 0, 0, 48, 0, 190, 0, 10, 0, 0, 0],
  ];

  List<List<int>> dataWithMoreData = [
    [159, 3, 0, 27, 1, 33, 0, 0, 0, 0, 44, 0, 64, 1, 10, 0, 0, 0, 13, 0],
    [0, 124, 0, 0, 0, 2, 0, 0, 0, 0, 0, 10, 43, 0, 221, 6]
  ];

  test('cross trainer features', () {
    var d = data[0];

    var crossTrainer = CrossTrainer(d);

    var featureMap = crossTrainer.getDeviceDataFeatures();

    expect(featureMap[DeviceDataFlag.moreDataFlag], false);
    expect(featureMap[DeviceDataFlag.avgSpeedFlag], true);
    expect(featureMap[DeviceDataFlag.totalDistanceFlag], true);
    //expect(featureMap[DeviceDataFlag.stepCountFlag], false);
    expect(featureMap[DeviceDataFlag.strideCountFlag], true /* maybe */);
    expect(featureMap[DeviceDataFlag.elevationGainFlag], false);
    expect(featureMap[DeviceDataFlag.inclinationAndRampAngleFlag], false);
    expect(featureMap[DeviceDataFlag.resistanceLevelFlag], true);
    expect(featureMap[DeviceDataFlag.instPowerFlag], true);
    expect(featureMap[DeviceDataFlag.avgPowerFlag], true);
    expect(featureMap[DeviceDataFlag.expendedEnergyFlag], true);
    //expect(featureMap[DeviceDataFlag.heartRateFlag], true);
    expect(featureMap[DeviceDataFlag.metabolicEquivalentFlag], true);
    expect(featureMap[DeviceDataFlag.elapsedTimeFlag], true);
    expect(featureMap[DeviceDataFlag.remainingTimeFlag], true);
    expect(featureMap[DeviceDataFlag.movementDirectionFlag], false /* maybe */);
  });

  test('cross trainer parse average speed correct', () {
    var averageSpeedResults = List<num>.empty(growable: true);
    for (var d in data) {
      var crossTrainer = CrossTrainer(d);

      var averageSpeed = crossTrainer
          .getParameterValueByName(DeviceDataParameterName.avgSpeed)!;

      averageSpeedResults.add(averageSpeed.value * averageSpeed.factor);
    }

    expect(
        listEquals(averageSpeedResults, [
          0.0,
          0.0,
          0.0,
          0.0,
          0.0,
          0.8300000000000001,
          1.4000000000000001,
          1.83,
          2.19,
          2.5100000000000002,
          2.7800000000000002,
          3.0100000000000002,
          3.2,
          3.36,
          3.5100000000000002,
          3.63,
          3.74,
          3.84,
          3.93,
          3.73,
          3.5500000000000003,
          3.39,
          3.24,
          3.11
        ]),
        true);
  });

  test('cross trainer parse total distance data correct', () {
    var totalDistanceResults = List<num>.empty(growable: true);
    for (var d in data) {
      var crossTrainer = CrossTrainer(d);

      var totalDistance = crossTrainer
          .getParameterValueByName(DeviceDataParameterName.totalDistance)!;

      totalDistanceResults.add(totalDistance.value * totalDistance.factor);
    }

    expect(
        listEquals(totalDistanceResults, [
          0,
          0,
          0,
          0,
          0,
          1,
          2,
          4,
          5,
          6,
          8,
          10,
          11,
          13,
          14,
          16,
          17,
          19,
          20,
          20,
          20,
          20,
          20,
          20
        ]),
        true);
  });

  test('cross trainer parse moreData data correct', () {
    //print(dataWithMoreData[0]);
    var d1 = CrossTrainer(dataWithMoreData[0]);
    var d2 = CrossTrainer(dataWithMoreData[1]);

    expect(
        d1
            .getParameterValueByName(DeviceDataParameterName.totalDistance)!
            .value,
        33);

    expect(
        d2.getParameterValueByName(DeviceDataParameterName.elapsedTime)!.value,
        43);
    expect(
        d2.getParameterValueByName(DeviceDataParameterName.totalEnergy)!.value,
        2);

    d1.merge(d2);

    expect(
        d1
            .getParameterValueByName(DeviceDataParameterName.totalDistance)!
            .value,
        33);

    expect(
        d1.getParameterValueByName(DeviceDataParameterName.elapsedTime)!.value,
        43);
    expect(
        d1.getParameterValueByName(DeviceDataParameterName.totalEnergy)!.value,
        2);
  });
}
