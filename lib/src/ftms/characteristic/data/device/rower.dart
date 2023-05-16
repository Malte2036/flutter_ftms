import 'package:flutter_ftms/flutter_ftms.dart';
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
        const FTMSDataParameter(
            FTMSDataParameterName.strokeRate, null, 1, "stroke/min", 0.5),
        const FTMSDataParameter(
            FTMSDataParameterName.strokeCount, null, 2, "", 1),
        const FTMSDataParameter(FTMSDataParameterName.avgStrokeRate,
            FTMSDataFlag.avgStrokeFlag, 1, "stroke/min", 0.5),
        const FTMSDataParameter(FTMSDataParameterName.totalDistance,
            FTMSDataFlag.totalDistanceFlag, 3, "metre", 1),
        const FTMSDataParameter(FTMSDataParameterName.instPace,
            FTMSDataFlag.instPaceFlag, 2, "Seconds(500m)", 1),
        const FTMSDataParameter(FTMSDataParameterName.avgPace,
            FTMSDataFlag.avgPaceFlag, 2, "Seconds(500m)", 1),
        const FTMSDataParameter(FTMSDataParameterName.instPower,
            FTMSDataFlag.instPowerFlag, 2, "watt", 1),
        const FTMSDataParameter(FTMSDataParameterName.avgPower,
            FTMSDataFlag.avgPowerFlag, 2, "watt", 1),
        const FTMSDataParameter(FTMSDataParameterName.resistanceLevel,
            FTMSDataFlag.resistanceLevelFlag, 2, "", 1),
        const FTMSDataParameter(FTMSDataParameterName.totalEnergy,
            FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(FTMSDataParameterName.energyPerHour,
            FTMSDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const FTMSDataParameter(FTMSDataParameterName.energyPerMinute,
            FTMSDataFlag.expendedEnergyFlag, 1, "kcal", 1),
        const FTMSDataParameter(FTMSDataParameterName.heartRate,
            FTMSDataFlag.heartRateFlag, 1, "Beats/m", 1),
        const FTMSDataParameter(FTMSDataParameterName.metabolicEquivalent,
            FTMSDataFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const FTMSDataParameter(FTMSDataParameterName.elapsedTime,
            FTMSDataFlag.elapsedTimeFlag, 2, "second", 1),
        const FTMSDataParameter(FTMSDataParameterName.remainingTime,
            FTMSDataFlag.remainingTimeFlag, 2, "second", 1),
      ];

  @override
  FTMSDataType get ftmsDataType => FTMSDataType.rower;
}
