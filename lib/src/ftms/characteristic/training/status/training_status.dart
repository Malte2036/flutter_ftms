import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/utils.dart';

class TrainingStatus {
  final List<int> _trainingStatusData;

  List<Flag> get allTrainingStatusFlags => [
        TrainingStatusFlag.trainingStatusStringPresent,
        TrainingStatusFlag.extendedStringPresent
      ];

  List<Flag> get allTrainingStatusTypes => [
        TrainingStatusType.other,
        TrainingStatusType.idle,
        TrainingStatusType.warmingUp,
        TrainingStatusType.lowIntensityInterval,
        TrainingStatusType.highIntensityInterval,
        TrainingStatusType.recoveryInterval,
        TrainingStatusType.isometric,
        TrainingStatusType.heartRateControl,
        TrainingStatusType.fitnessTest,
        TrainingStatusType.speedLow,
        TrainingStatusType.speedHigh,
        TrainingStatusType.coolDown,
        TrainingStatusType.wattControl,
        TrainingStatusType.manualMode,
        TrainingStatusType.preWorkout,
        TrainingStatusType.postWorkout,
        TrainingStatusType.reserved,
      ];

  static const _flagBitSize = 8;

  TrainingStatus(this._trainingStatusData);

  Map<Flag, bool> getFeatures() {
    return Utils.flagsToFeatureMap(
        _trainingStatusData, _flagBitSize, allTrainingStatusFlags);
  }

  Flag getTrainingStatusType() {
    var value = Utils.intArrayToLittleEndian(
        _trainingStatusData.getRange(1, 2).toList());

    return allTrainingStatusTypes[value];
  }
}
