import 'package:flutter_ftms/src/ftms/characteristic/machine/feature/machine_feature_flag.dart';
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

  static const _featureBitSize = 32;

  MachineFeature(this.data);

  Map<Flag, bool> getFeatureFlags() {
    return Utils.flagsToFeatureMap(
        data, _featureBitSize, allMachineFeatureFlags);
  }
}
