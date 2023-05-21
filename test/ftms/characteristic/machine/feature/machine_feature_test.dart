import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<int> dataIndoorBike = [2, 64, 0, 0, 8, 32, 0, 0];

  test("feature indoor bike test", () {
    var feature = MachineFeature(dataIndoorBike);

    var featureFlags = feature.getFeatureFlags();
    const availableFeatures = [
      MachineFeatureFlag.cadenceFlag,
      MachineFeatureFlag.powerMeasurementFlag
    ];

    for (var feature in availableFeatures) {
      expect(featureFlags[feature], true);
    }

    feature.allMachineFeatureFlags
        .where((feature) => !availableFeatures.contains(feature))
        .forEach((feature) => expect(featureFlags[feature], false));
  });
}
