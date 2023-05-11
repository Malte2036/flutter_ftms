import 'package:flutter_ftms/src/ftms/ftms_feature.dart';
import 'package:flutter_ftms/src/ftms/ftms_feature_flag.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<int> dataIndoorBike = [2, 64, 0, 0, 8, 32, 0, 0];

  test("feature indoor bike test", () {
    var feature = FTMSFeature(dataIndoorBike);

    var featureFlags = feature.getFeatureFlags();
    const availableFeatures = [
      FTMSFeatureFlag.cadenceFlag,
      FTMSFeatureFlag.powerMeasurementFlag
    ];

    for (var feature in availableFeatures) {
      expect(featureFlags[feature], true);
    }

    feature.allFTMSFeatureFlags
        .where((feature) => !availableFeatures.contains(feature))
        .forEach((feature) => expect(featureFlags[feature], false));
  });
}
