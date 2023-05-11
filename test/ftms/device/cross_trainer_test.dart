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

  test('cross trainer features', () {
    var d = data[0];

    var crossTrainer = CrossTrainer(d);

    var featureMap = crossTrainer.getFTMSDataFeatures();

    expect(featureMap[FTMSDataFlag.moreDataFlag], false);
    expect(featureMap[FTMSDataFlag.avgSpeedFlag], true);
    expect(featureMap[FTMSDataFlag.totalDistanceFlag], true);
    //expect(featureMap[FTMSFlag.stepCountFlag], false);
    expect(featureMap[FTMSDataFlag.strideCountFlag], true /* maybe */);
    expect(featureMap[FTMSDataFlag.elevationGainFlag], false);
    expect(featureMap[FTMSDataFlag.inclinationAndRampAngleFlag], false);
    expect(featureMap[FTMSDataFlag.resistanceLevelFlag], true);
    expect(featureMap[FTMSDataFlag.instPowerFlag], true);
    expect(featureMap[FTMSDataFlag.avgPowerFlag], true);
    expect(featureMap[FTMSDataFlag.expendedEnergyFlag], true);
    //expect(featureMap[FTMSFlag.heartRateFlag], true);
    expect(featureMap[FTMSDataFlag.metabolicEquivalentFlag], true);
    expect(featureMap[FTMSDataFlag.elapsedTimeFlag], true);
    expect(featureMap[FTMSDataFlag.remainingTimeFlag], true);
    expect(featureMap[FTMSDataFlag.movementDirectionFlag], false /* maybe */);
  });

  test('cross trainer parse average speed correct', () {
    var averageSpeedResults = List<num>.empty(growable: true);
    for (var d in data) {
      var crossTrainer = CrossTrainer(d);

      var averageSpeed = crossTrainer
          .getFTMSDataParameterValues()
          .firstWhere((element) => element.name == "Average Speed");

      averageSpeedResults.add(averageSpeed.value * averageSpeed.factor);
    }

    expect(
        listEquals(averageSpeedResults, [
          0.0,
          0.0,
          0.0,
          0.0,
          2.56,
          3.39,
          3.96,
          4.39,
          4.75,
          7.63,
          5.34,
          5.57,
          5.76,
          5.92,
          6.07,
          6.19,
          6.3,
          6.4,
          6.49,
          1.17,
          0.99,
          0.8300000000000001,
          0.68,
          0.55
        ]),
        true);
  });

  /*test('cross trainer parse total distance data correct', () {
    for (var d in data) {
      var crossTrainer = CrossTrainer(d);

      var totalDistance = crossTrainer
          .getFTMSDataParameterValues()
          .firstWhere((element) => element.name == "Total Distance");
      print(totalDistance);

      //expect(totalDistance.value * totalDistance.factor, 5.34);
    }
  });*/
}
