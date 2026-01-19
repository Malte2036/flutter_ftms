import 'package:flutter_ftms/src/ftms/characteristic/machine/feature/machine_feature_flag.dart';
import 'package:flutter_ftms/src/ftms/characteristic/machine/feature/target_setting_flag.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/utils.dart';

class MachineFeature {
  final List<int> data;

  List<Flag> get allMachineFeatureFlags => [
        MachineFeatureFlag.averageSpeedFlag,
        MachineFeatureFlag.cadenceFlag,
        MachineFeatureFlag.totalDistanceFlag,
        MachineFeatureFlag.inclinationFlag,
        MachineFeatureFlag.elevationGainFlag,
        MachineFeatureFlag.paceFlag,
        MachineFeatureFlag.stepCountFlag,
        MachineFeatureFlag.resistanceLevelFlag,
        MachineFeatureFlag.strideCountFlag,
        MachineFeatureFlag.expendedEnergyFlag,
        MachineFeatureFlag.heartRateFlag,
        MachineFeatureFlag.metabolicEquivalentFlag,
        MachineFeatureFlag.elapsedTimeFlag,
        MachineFeatureFlag.remainingTimeFlag,
        MachineFeatureFlag.powerMeasurementFlag,
        MachineFeatureFlag.forceOnBeltAndPowerOutputFlag,
        MachineFeatureFlag.userDataRetentionFlag,
      ];
  
  List<Flag> get allTargetSettingFlags => [
        TargetSettingFlag.speedTargetSettingFlag,
        TargetSettingFlag.inclinationTargetSettingFlag,
        TargetSettingFlag.resistanceTargetSettingFlag,
        TargetSettingFlag.powerTargetSettingFlag,
        TargetSettingFlag.heartRateTargetSettingFlag,
        TargetSettingFlag.targetedExpendedEnergyFlag,
        TargetSettingFlag.targetedStepNumberFlag,
        TargetSettingFlag.targetedStrideNumberFlag,
        TargetSettingFlag.targetedDistanceFlag,
        TargetSettingFlag.targetedTrainingTimeFlag,
        TargetSettingFlag.targetedTimeInTwoHeartRateZonesFlag,
        TargetSettingFlag.targetedTimeInThreeHeartRateZonesFlag,
        TargetSettingFlag.targetedTimeInFiveHeartRateZonesFlag,
        TargetSettingFlag.indoorBikeSimulationParametersFlag,
        TargetSettingFlag.wheelCircumferenceConfigurationFlag,
        TargetSettingFlag.spinDownControlFlag,
        TargetSettingFlag.targetedCadenceFlag,
        // Bits 17-31 are reserved for future use
      ];

  static const _featureBitSize = 32;

  MachineFeature(this.data);

  Map<Flag, bool> getFeatureFlags() {
    return Utils.flagsToFeatureMap(
        data, _featureBitSize, allMachineFeatureFlags);
  }
  Map<Flag, bool> getTargetSettingFlags() {
    return Utils.flagsToFeatureMap(
        data.skip(4).toList(), _featureBitSize, allTargetSettingFlags);
  }
}
