import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_flag.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_parameter.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_parameter_name.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';

class CrossTrainer extends FTMSData {
  @override
  FTMSDataType get ftmsDataType => FTMSDataType.crossTrainer;

  @override
  List<Flag> get allFTMSDataFlags => [
        FTMSDataFlag.moreDataFlag,
        FTMSDataFlag.avgSpeedFlag,
        FTMSDataFlag.totalDistanceFlag,
        FTMSDataFlag.stepCountFlag,
        FTMSDataFlag.strideCountFlag,
        FTMSDataFlag.elevationGainFlag,
        FTMSDataFlag.inclinationAndRampAngleFlag,
        FTMSDataFlag.resistanceLevelFlag,
        FTMSDataFlag.instPowerFlag,
        FTMSDataFlag.avgPowerFlag,
        FTMSDataFlag.expendedEnergyFlag,
        FTMSDataFlag.heartRateFlag,
        FTMSDataFlag.metabolicEquivalentFlag,
        FTMSDataFlag.elapsedTimeFlag,
        FTMSDataFlag.remainingTimeFlag,
        FTMSDataFlag.movementDirectionFlag,
      ];

  @override
  List<FTMSDataParameter> get allFTMSDataParameters => [
        const FTMSDataParameter(
            FTMSDataParameterName.placeholder /* WHY? */, null, 1, "", 1),
        const FTMSDataParameter(
            FTMSDataParameterName.instSpeed, null, 2, "Km/h", 0.01),
        const FTMSDataParameter(FTMSDataParameterName.avgSpeed,
            FTMSDataFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const FTMSDataParameter(FTMSDataParameterName.totalDistance,
            FTMSDataFlag.totalDistanceFlag, 3, "metre", 1),
        const FTMSDataParameter(FTMSDataParameterName.stepPerMinute,
            FTMSDataFlag.stepCountFlag, 2, "step_per_minute", 1),
        const FTMSDataParameter(FTMSDataParameterName.avgStepRate,
            FTMSDataFlag.stepCountFlag, 2, "step_per_minute", 1),
        const FTMSDataParameter(FTMSDataParameterName.strideCount,
            FTMSDataFlag.strideCountFlag, 2, "" /*"unitless"*/, 1),
        const FTMSDataParameter(FTMSDataParameterName.inclination,
            FTMSDataFlag.inclinationAndRampAngleFlag, 2, "percent", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.rampAngleSetting,
            FTMSDataFlag.inclinationAndRampAngleFlag, 2, "degree", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.positiveElevationGain,
            FTMSDataFlag.elevationGainFlag, 2, "metre", 1),
        const FTMSDataParameter(FTMSDataParameterName.negativeElevationGain,
            FTMSDataFlag.elevationGainFlag, 2, "metre", 1),
        const FTMSDataParameter(FTMSDataParameterName.resistanceLevel,
            FTMSDataFlag.resistanceLevelFlag, 2, "" /*"unitless"*/, 0.1,
            signed: true),
        const FTMSDataParameter(FTMSDataParameterName.instPower,
            FTMSDataFlag.instPowerFlag, 2, "Watt", 1,
            signed: true),
        const FTMSDataParameter(FTMSDataParameterName.avgPower,
            FTMSDataFlag.avgPowerFlag, 2, "Watt", 1,
            signed: true),
        const FTMSDataParameter(FTMSDataParameterName.totalEnergy,
            FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(FTMSDataParameterName.energyPerHour,
            FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(FTMSDataParameterName.energyPerMinute,
            FTMSDataFlag.expendedEnergyFlag, 1, "kcal", 1),
        const FTMSDataParameter(FTMSDataParameterName.heartRate,
            FTMSDataFlag.heartRateFlag, 1, "beats/m", 1),
        const FTMSDataParameter(FTMSDataParameterName.metabolicEquivalent,
            FTMSDataFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.elapsedTime,
            FTMSDataFlag.elapsedTimeFlag, 2, "second", 1),
        const FTMSDataParameter(FTMSDataParameterName.remainingTime,
            FTMSDataFlag.remainingTimeFlag, 2, "second", 1),
      ];

  CrossTrainer(ftmsData) : super(ftmsData);
}
