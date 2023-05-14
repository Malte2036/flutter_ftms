import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_flag.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_parameter.dart';
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
        const FTMSDataParameter("placeholder" /* WHY? */, null, 1, "", 1),
        const FTMSDataParameter("Instantaneous Speed", null, 2, "Km/h", 0.01),
        const FTMSDataParameter(
            "Average Speed", FTMSDataFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const FTMSDataParameter(
            "Total Distance", FTMSDataFlag.totalDistanceFlag, 3, "metre", 1),
        const FTMSDataParameter("Step Per Minute", FTMSDataFlag.stepCountFlag,
            2, "step_per_minute", 1),
        const FTMSDataParameter("Average Step Rate", FTMSDataFlag.stepCountFlag,
            2, "step_per_minute", 1),
        const FTMSDataParameter("Stride Count", FTMSDataFlag.strideCountFlag, 2,
            "" /*"unitless"*/, 1),
        const FTMSDataParameter("Inclination",
            FTMSDataFlag.inclinationAndRampAngleFlag, 2, "percent", 0.1),
        const FTMSDataParameter("Ramp Angle Setting",
            FTMSDataFlag.inclinationAndRampAngleFlag, 2, "degree", 0.1),
        const FTMSDataParameter("Positive Elevation Gain",
            FTMSDataFlag.elevationGainFlag, 2, "metre", 1),
        const FTMSDataParameter("Negative Elevation Gain",
            FTMSDataFlag.elevationGainFlag, 2, "metre", 1),
        const FTMSDataParameter("Resistance Level",
            FTMSDataFlag.resistanceLevelFlag, 2, "" /*"unitless"*/, 0.1,
            signed: true),
        const FTMSDataParameter(
            "Instantaneous Power", FTMSDataFlag.instPowerFlag, 2, "Watt", 1,
            signed: true),
        const FTMSDataParameter(
            "Average Power", FTMSDataFlag.avgPowerFlag, 2, "Watt", 1,
            signed: true),
        const FTMSDataParameter(
            "Total Energy", FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Hour", FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Minute", FTMSDataFlag.expendedEnergyFlag, 1, "kcal", 1),
        const FTMSDataParameter(
            "Heart Rate", FTMSDataFlag.heartRateFlag, 1, "beats/m", 1),
        const FTMSDataParameter("Metabolic Equivalent",
            FTMSDataFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const FTMSDataParameter(
            "Elapsed Time", FTMSDataFlag.elapsedTimeFlag, 2, "second", 1),
        const FTMSDataParameter(
            "Remaining Time", FTMSDataFlag.remainingTimeFlag, 2, "second", 1),
      ];

  CrossTrainer(ftmsData) : super(ftmsData);
}
