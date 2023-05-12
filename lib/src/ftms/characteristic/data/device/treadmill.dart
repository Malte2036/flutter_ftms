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
        const FTMSDataParameter("Instantaneous Speed", null, 2, "Km/h", 0.01),
        const FTMSDataParameter(
            "Average Speed", FTMSDataFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const FTMSDataParameter(
            "Total Distance", FTMSDataFlag.totalDistanceFlag, 3, "metre", 1),
        const FTMSDataParameter("Inclination",
            FTMSDataFlag.inclinationAndRampAngleFlag, 2, "percent", 0.1),
        const FTMSDataParameter("Ramp Angle Setting",
            FTMSDataFlag.inclinationAndRampAngleFlag, 2, "degree", 0.1),
        const FTMSDataParameter("Positive Elevation Gain",
            FTMSDataFlag.elevationGainFlag, 2, "metre", 0.1),
        const FTMSDataParameter("Negative Elevation Gain",
            FTMSDataFlag.elevationGainFlag, 2, "metre", 0.1),
        const FTMSDataParameter(
            "Instantaneous Pace", FTMSDataFlag.instPaceFlag, 1, "Km/m", 0.1),
        const FTMSDataParameter(
            "Average Pace", FTMSDataFlag.avgPaceFlag, 1, "Km/m", 0.1),
        const FTMSDataParameter(
            "Expended Energy", FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(
            "Heart Rate", FTMSDataFlag.heartRateFlag, 1, "Beats/m", 1),
        const FTMSDataParameter("Metabolic Equivalent",
            FTMSDataFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const FTMSDataParameter(
            "Elapsed Time", FTMSDataFlag.elapsedTimeFlag, 2, "second", 1),
        const FTMSDataParameter(
            "Remaining Time", FTMSDataFlag.remainingTimeFlag, 2, "second", 1),
        const FTMSDataParameter("Force on Belt",
            FTMSDataFlag.forceOnBeltAndPowerOutputFlag, 2, "newton", 1),
        const FTMSDataParameter("Power Output",
            FTMSDataFlag.forceOnBeltAndPowerOutputFlag, 2, "watt", 1),
      ];

  @override
  FTMSDataType get ftmsDataType => FTMSDataType.treadmill;

  Treadmill(super.ftmsData);
}
