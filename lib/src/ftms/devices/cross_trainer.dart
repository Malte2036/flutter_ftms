import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/ftms_flag.dart';
import 'package:flutter_ftms/src/ftms/ftms_patameter.dart';

class CrossTrainer extends FTMSData {
  @override
  FTMSDataType get ftmsDataType => FTMSDataType.crossTrainer;

  @override
  List<Flag> get allFTMSDataFlags => [
        FTMSFlag.moreDataFlag,
        FTMSFlag.avgSpeedFlag,
        FTMSFlag.totalDistanceFlag,
        FTMSFlag.stepCountFlag,
        FTMSFlag.strideCountFlag,
        FTMSFlag.elevationGainFlag,
        FTMSFlag.inclinationAndRampAngleFlag,
        FTMSFlag.resistanceLevelFlag,
        FTMSFlag.instPowerFlag,
        FTMSFlag.avgPowerFlag,
        FTMSFlag.expendedEnergyFlag,
        FTMSFlag.heartRateFlag,
        FTMSFlag.metabolicEquivalentFlag,
        FTMSFlag.elapsedTimeFlag,
        FTMSFlag.remainingTimeFlag,
        FTMSFlag.movementDirectionFlag,
      ];

  @override
  List<FTMSDataParameter> get allFTMSDataParameters => [
        const FTMSDataParameter("Instantaneous Speed", null, 2, "Km/h", 0.01),
        const FTMSDataParameter(
            "Average Speed", FTMSFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const FTMSDataParameter(
            "Total Distance", FTMSFlag.totalDistanceFlag, 3, "metre", 1),
        const FTMSDataParameter(
            "Step Per Minute", FTMSFlag.stepCountFlag, 2, "step_per_minute", 1),
        const FTMSDataParameter("Average Step Rate", FTMSFlag.stepCountFlag, 2,
            "step_per_minute", 1),
        const FTMSDataParameter(
            "Stride Count", FTMSFlag.strideCountFlag, 2, "" /*"unitless"*/, 1),
        const FTMSDataParameter("Inclination",
            FTMSFlag.inclinationAndRampAngleFlag, 2, "percent", 0.1),
        const FTMSDataParameter("Ramp Angle Setting",
            FTMSFlag.inclinationAndRampAngleFlag, 2, "degree", 0.1),
        const FTMSDataParameter("Positive Elevation Gain",
            FTMSFlag.elevationGainFlag, 2, "metre", 1),
        const FTMSDataParameter("Negative Elevation Gain",
            FTMSFlag.elevationGainFlag, 2, "metre", 1),
        const FTMSDataParameter("Resistance Level",
            FTMSFlag.resistanceLevelFlag, 2, "" /*"unitless"*/, 0.1,
            signed: true),
        const FTMSDataParameter(
            "Instantaneous Power", FTMSFlag.instPowerFlag, 2, "Watt", 1,
            signed: true),
        const FTMSDataParameter(
            "Average Power", FTMSFlag.avgPowerFlag, 2, "Watt", 1,
            signed: true),
        const FTMSDataParameter(
            "Total Energy", FTMSFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Hour", FTMSFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Minute", FTMSFlag.expendedEnergyFlag, 1, "kcal", 1),
        const FTMSDataParameter(
            "Heart Rate", FTMSFlag.heartRateFlag, 1, "beats/m", 1),
        const FTMSDataParameter("Metabolic Equivalent",
            FTMSFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const FTMSDataParameter(
            "Elapsed Time", FTMSFlag.elapsedTimeFlag, 2, "second", 1),
        const FTMSDataParameter(
            "Remaining Time", FTMSFlag.remainingTimeFlag, 2, "second", 1),
      ];

  CrossTrainer(ftmsData) : super(ftmsData);
}
