import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_flag.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_parameter.dart';

class Treadmill extends FTMSData {
  @override
  List<Flag> get allFTMSDataFlags => [
        FTMSDataFlag.moreDataFlag,
        FTMSDataFlag.avgSpeedFlag,
        FTMSDataFlag.totalDistanceFlag,
        FTMSDataFlag.inclinationAndRampAngleFlag,
        FTMSDataFlag.elevationGainFlag,
        FTMSDataFlag.instPaceFlag,
        FTMSDataFlag.avgPaceFlag,
        FTMSDataFlag.expendedEnergyFlag,
        FTMSDataFlag.heartRateFlag,
        FTMSDataFlag.metabolicEquivalentFlag,
        FTMSDataFlag.elapsedTimeFlag,
        FTMSDataFlag.remainingTimeFlag,
        FTMSDataFlag.forceOnBeltAndPowerOutputFlag
      ];

  @override
  List<FTMSDataParameter> get allFTMSDataParameters => [
        const FTMSDataParameter(
            FTMSDataParameterName.instSpeed, null, 2, "Km/h", 0.01),
        const FTMSDataParameter(FTMSDataParameterName.avgSpeed,
            FTMSDataFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const FTMSDataParameter(FTMSDataParameterName.totalDistance,
            FTMSDataFlag.totalDistanceFlag, 3, "metre", 1),
        const FTMSDataParameter(FTMSDataParameterName.inclination,
            FTMSDataFlag.inclinationAndRampAngleFlag, 2, "percent", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.rampAngleSetting,
            FTMSDataFlag.inclinationAndRampAngleFlag, 2, "degree", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.positiveElevationGain,
            FTMSDataFlag.elevationGainFlag, 2, "metre", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.negativeElevationGain,
            FTMSDataFlag.elevationGainFlag, 2, "metre", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.instPace,
            FTMSDataFlag.instPaceFlag, 1, "Km/m", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.avgPace,
            FTMSDataFlag.avgPaceFlag, 1, "Km/m", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.expendedEnergy,
            FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(FTMSDataParameterName.heartRate,
            FTMSDataFlag.heartRateFlag, 1, "Beats/m", 1),
        const FTMSDataParameter(FTMSDataParameterName.metabolicEquivalent,
            FTMSDataFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.elapsedTime,
            FTMSDataFlag.elapsedTimeFlag, 2, "second", 1),
        const FTMSDataParameter(FTMSDataParameterName.remainingTime,
            FTMSDataFlag.remainingTimeFlag, 2, "second", 1),
        const FTMSDataParameter(FTMSDataParameterName.forceOnBelt,
            FTMSDataFlag.forceOnBeltAndPowerOutputFlag, 2, "newton", 1),
        const FTMSDataParameter(FTMSDataParameterName.powerOutput,
            FTMSDataFlag.forceOnBeltAndPowerOutputFlag, 2, "watt", 1),
      ];

  @override
  FTMSDataType get ftmsDataType => FTMSDataType.treadmill;

  Treadmill(super.ftmsData);
}
