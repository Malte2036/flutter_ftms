import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/ftms_flag.dart';
import 'package:flutter_ftms/src/ftms/ftms_patameter.dart';

class IndoorBike extends FTMSData {
  @override
  FTMSDataType get ftmsDataType => FTMSDataType.indoorBike;

  @override
  List<Flag> get allFTMSDataFlags => [
        FTMSFlag.moreDataFlag,
        FTMSFlag.avgSpeedFlag,
        FTMSFlag.instCadenceFlag,
        FTMSFlag.avgCadenceFlag,
        FTMSFlag.totalDistanceFlag,
        FTMSFlag.resistanceLevelFlag,
        FTMSFlag.instPowerFlag,
        FTMSFlag.avgPowerFlag,
        FTMSFlag.expendedEnergyFlag,
        FTMSFlag.heartRateFlag,
        FTMSFlag.metabolicEquivalentFlag,
        FTMSFlag.elapsedTimeFlag,
        FTMSFlag.remainingTimeFlag
      ];

  @override
  List<FTMSDataParameter> get allFTMSDataParameters => [
        const FTMSDataParameter("Instantaneous Speed", null, 2, "Km/h", 0.01),
        const FTMSDataParameter(
            "Average Speed", FTMSFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const FTMSDataParameter(
            "Instantaneous Cadence", FTMSFlag.instCadenceFlag, 2, "/min", 0.5),
        const FTMSDataParameter(
            "Average Cadence", FTMSFlag.avgCadenceFlag, 2, "/min", 0.5),
        const FTMSDataParameter(
            "Total Distance", FTMSFlag.totalDistanceFlag, 3, "metre", 1),
        const FTMSDataParameter(
            "Resistance Level", FTMSFlag.resistanceLevelFlag, 2, "unitless", 1),
        const FTMSDataParameter(
            "Instantaneous Power", FTMSFlag.instPowerFlag, 2, "watt", 1),
        const FTMSDataParameter(
            "Average Power", FTMSFlag.avgPowerFlag, 2, "watt", 1),
        const FTMSDataParameter(
            "Total Energy", FTMSFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Hour", FTMSFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Energy Per Minute", FTMSFlag.expendedEnergyFlag, 1, "kcal", 1),
        const FTMSDataParameter(
            "Heart Rate", FTMSFlag.heartRateFlag, 1, "Beats/m", 1),
        const FTMSDataParameter("Metabolic Equivalent",
            FTMSFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const FTMSDataParameter(
            "Elapsed Time", FTMSFlag.elapsedTimeFlag, 2, "second", 1),
        const FTMSDataParameter(
            "Remaining Time", FTMSFlag.remainingTimeFlag, 2, "second", 1),
      ];

  IndoorBike(ftmsData) : super(ftmsData);
}
