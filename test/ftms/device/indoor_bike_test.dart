import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const List<List<int>> data = [
    // cadence: 180 (90)
    // power: 102
    [68, 0, 0, 0, 180, 0, 102, 0],
    // cadence: 360 (180)
    // power: 100
    [68, 0, 0, 0, 104, 1, 100, 0],
    // cadence: 260 (130)
    // power: 101
    [68, 0, 0, 0, 4, 1, 101, 0]
  ];

  test('indoor bike features', () {
    var d = data[0];

    var indoorBike = IndoorBike(d);

    var featureMap = indoorBike.getFTMSDataFeatures();

    const availableFeatures = [
      FTMSDataFlag.instCadenceFlag,
      FTMSDataFlag.instPowerFlag
    ];

    for (var featureFlag in availableFeatures) {
      expect(featureMap[featureFlag], true);
    }

    indoorBike.allFTMSDataFlags
        .where((feature) => !availableFeatures.contains(feature))
        .forEach((feature) => expect(featureMap[feature], false));
  });

  test('indoor bike parse simple data correct', () {
    var d = data[0];

    var indoorBike = IndoorBike(d);

    var instantaneousCadence =
        indoorBike.getParameterValueByName(FTMSDataParameterName.instCadence)!;

    expect(instantaneousCadence.value, 180);

    var instantaneousPower =
        indoorBike.getParameterValueByName(FTMSDataParameterName.instPower)!;

    expect(instantaneousPower.value, 102);
  });

  test('indoor bike parse medium data correct', () {
    var d = data[1];

    var indoorBike = IndoorBike(d);

    var instantaneousCadence =
        indoorBike.getParameterValueByName(FTMSDataParameterName.instCadence)!;

    expect(instantaneousCadence.value, 360);

    var instantaneousPower =
        indoorBike.getParameterValueByName(FTMSDataParameterName.instPower)!;

    expect(instantaneousPower.value, 100);
  });

  test('indoor bike parse complex data correct', () {
    var d = data[2];

    var indoorBike = IndoorBike(d);

    var instantaneousCadence =
        indoorBike.getParameterValueByName(FTMSDataParameterName.instCadence)!;

    expect(instantaneousCadence.value, 260);

    var instantaneousPower =
        indoorBike.getParameterValueByName(FTMSDataParameterName.instPower)!;

    expect(instantaneousPower.value, 101);
  });
}
