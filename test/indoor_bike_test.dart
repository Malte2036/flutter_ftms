import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const List<List<int>> data = [
    // cadence: 180 (90)
    // power: 102
    [68, 0, 0, 0, 180, 0, 102, 0],
    // cadence: 360 (180)
    // power: 103
    [68, 0, 0, 0, 104, 1, 100, 0]
  ];

  test('indoor bike features', () {
    var d = data[0];

    var indoorBike = IndoorBike(d);

    var featureMap = indoorBike.getFTMSDataFeatures();

    const availableFeatures = ["Instantaneous Cadence", "Instantaneous Power"];

    availableFeatures.forEach((feature) => expect(featureMap[feature], true));

    indoorBike.allFTMSDataFlags
        .where((feature) => !availableFeatures.contains(feature))
        .forEach((feature) => expect(featureMap[feature], false));
  });

  test('indoor bike parse simple data correct', () {
    var d = data[0];

    var indoorBike = IndoorBike(d);

    var instantaneousCadence = indoorBike.parameterValues
        .firstWhere((value) => value.name == "Instantaneous Cadence");

    expect(instantaneousCadence.value * instantaneousCadence.factor, 90);

    var instantaneousPower = indoorBike.parameterValues
        .firstWhere((value) => value.name == "Instantaneous Power");

    expect(instantaneousPower.value * instantaneousPower.factor, 102);
  });
}
