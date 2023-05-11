import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/ftms_data_flag.dart';
import 'package:flutter_ftms/src/ftms/ftms_parameter.dart';

class IndoorBike extends FTMSData {
  @override
  FTMSDataType get ftmsDataType => FTMSDataType.indoorBike;

  @override
  List<Flag> get allFTMSDataFlags => [
        FTMSDataFlag.moreDataFlag,
        FTMSDataFlag.avgSpeedFlag,
        FTMSDataFlag.instCadenceFlag,
        FTMSDataFlag.avgCadenceFlag,
        FTMSDataFlag.totalDistanceFlag,
        FTMSDataFlag.resistanceLevelFlag,
        FTMSDataFlag.instPowerFlag,
        FTMSDataFlag.avgPowerFlag,
        FTMSDataFlag.expendedEnergyFlag,
        FTMSDataFlag.heartRateFlag,
        FTMSDataFlag.metabolicEquivalentFlag,
        FTMSDataFlag.elapsedTimeFlag,
        FTMSDataFlag.remainingTimeFlag
      ];

  @override
  List<FTMSDataParameter> get allFTMSDataParameters => [
        const FTMSDataParameter("Instantaneous Speed", null, 2, "Km/h", 0.01),
        const FTMSDataParameter(
            "Average Speed", FTMSDataFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const FTMSDataParameter("Instantaneous Cadence",
            FTMSDataFlag.instCadenceFlag, 2, "/min", 0.5),
        const FTMSDataParameter(
            "Average Cadence", FTMSDataFlag.avgCadenceFlag, 2, "/min", 0.5),
        const FTMSDataParameter(
            "Total Distance", FTMSDataFlag.totalDistanceFlag, 3, "metre", 1),
        const FTMSDataParameter("Resistance Level",
            FTMSDataFlag.resistanceLevelFlag, 2, "unitless", 1),
        const FTMSDataParameter(
            "Instantaneous Power", FTMSDataFlag.instPowerFlag, 2, "watt", 1),
        const FTMSDataParameter(
            "Average Power", FTMSDataFlag.avgPowerFlag, 2, "watt", 1),
        const FTMSDataParameter(
            "Total Energy", FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Hour", FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Minute", FTMSDataFlag.expendedEnergyFlag, 1, "kcal", 1),
        const FTMSDataParameter(
            "Heart Rate", FTMSDataFlag.heartRateFlag, 1, "Beats/m", 1),
        const FTMSDataParameter("Metabolic Equivalent",
            FTMSDataFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const FTMSDataParameter(
            "Elapsed Time", FTMSDataFlag.elapsedTimeFlag, 2, "second", 1),
        const FTMSDataParameter(
            "Remaining Time", FTMSDataFlag.remainingTimeFlag, 2, "second", 1),
      ];

  IndoorBike(ftmsData) : super(ftmsData);
}
