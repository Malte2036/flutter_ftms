import 'package:flutter_ftms/src/ftms/characteristic/feature/ftms_feature_flag.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/utils.dart';

class FTMSFeature {
  final List<int> data;

  List<Flag> get allFTMSFeatureFlags => [
        FTMSFeatureFlag.averageSpeedFlag,
        FTMSFeatureFlag.cadenceFlag,
        FTMSFeatureFlag.totalDistanceFlag,
        FTMSFeatureFlag.inclinationFlag,
        FTMSFeatureFlag.elevationGainFlag,
        FTMSFeatureFlag.paceFlag,
        FTMSFeatureFlag.stepCountFlag,
        FTMSFeatureFlag.resistanceLevelFlag,
        FTMSFeatureFlag.strideCountFlag,
        FTMSFeatureFlag.expendedEnergyFlag,
        FTMSFeatureFlag.heartRateFlag,
        FTMSFeatureFlag.metabolicEquivalentFlag,
        FTMSFeatureFlag.elapsedTimeFlag,
        FTMSFeatureFlag.remainingTimeFlag,
        FTMSFeatureFlag.powerMeasurementFlag,
        FTMSFeatureFlag.forceOnBeltAndPowerOutputFlag,
        FTMSFeatureFlag.userDataRetentionFlag,
      ];

  static const _featureBitSize = 32;

  FTMSFeature(this.data);

  Map<Flag, bool> getFeatureFlags() {
    return Utils.flagsToFeatureMap(data, _featureBitSize, allFTMSFeatureFlags);
  }
}
