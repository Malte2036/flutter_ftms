import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_flag.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_parameter.dart';

class Rower extends FTMSData {
  Rower(super.ftmsData);

  @override
  List<Flag> get allFTMSDataFlags => [
        FTMSDataFlag.moreDataFlag,
        FTMSDataFlag.avgStrokeFlag,
        FTMSDataFlag.totalDistanceFlag,
        FTMSDataFlag.instPaceFlag,
        FTMSDataFlag.avgPaceFlag,
        FTMSDataFlag.instPowerFlag,
        FTMSDataFlag.avgPowerFlag,
        FTMSDataFlag.resistanceLevelFlag,
        FTMSDataFlag.expendedEnergyFlag,
        FTMSDataFlag.heartRateFlag,
        FTMSDataFlag.metabolicEquivalentFlag,
        FTMSDataFlag.elapsedTimeFlag,
        FTMSDataFlag.remainingTimeFlag
      ];

  @override
  List<FTMSDataParameter> get allFTMSDataParameters => [
        const FTMSDataParameter("Stroke Rate", null, 1, "stroke/min", 0.5),
        const FTMSDataParameter("Stroke Count", null, 2, "", 1),
        const FTMSDataParameter("Average Stroke Rate",
            FTMSDataFlag.avgStrokeFlag, 1, "stroke/min", 0.5),
        const FTMSDataParameter(
            "Total Distance", FTMSDataFlag.totalDistanceFlag, 3, "metre", 1),
        const FTMSDataParameter("Instantaneous Pace", FTMSDataFlag.instPaceFlag,
            2, "Seconds(500m)", 1),
        const FTMSDataParameter(
            "Average Pace", FTMSDataFlag.avgPaceFlag, 2, "Seconds(500m)", 1),
        const FTMSDataParameter(
            "Instantaneous Power", FTMSDataFlag.instPowerFlag, 2, "watt", 1),
        const FTMSDataParameter(
            "Average Power", FTMSDataFlag.avgPowerFlag, 2, "watt", 1),
        const FTMSDataParameter(
            "Resistance Level", FTMSDataFlag.resistanceLevelFlag, 2, "", 1),
        const FTMSDataParameter(
            "Total Energy", FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Hour", FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Minute", FTMSDataFlag.expendedEnergyFlag, 1, "kcal", 1),
        const FTMSDataParameter(
            "Hearth Rate", FTMSDataFlag.heartRateFlag, 1, "Beats/m", 1),
        const FTMSDataParameter("Metabolic Equivalent",
            FTMSDataFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const FTMSDataParameter(
            "Elapsed Time", FTMSDataFlag.elapsedTimeFlag, 2, "second", 1),
        const FTMSDataParameter(
            "Remaining Time", FTMSDataFlag.remainingTimeFlag, 2, "second", 1),
      ];

  @override
  FTMSDataType get ftmsDataType => FTMSDataType.rower;
}
