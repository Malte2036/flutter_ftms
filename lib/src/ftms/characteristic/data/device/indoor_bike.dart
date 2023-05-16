import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_flag.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/ftms_data_parameter.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';

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
        const FTMSDataParameter(
            FTMSDataParameterName.instSpeed, null, 2, "Km/h", 0.01),
        const FTMSDataParameter(FTMSDataParameterName.avgSpeed,
            FTMSDataFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const FTMSDataParameter(FTMSDataParameterName.instCadence,
            FTMSDataFlag.instCadenceFlag, 2, "/min", 0.5),
        const FTMSDataParameter(FTMSDataParameterName.avgCadence,
            FTMSDataFlag.avgCadenceFlag, 2, "/min", 0.5),
        const FTMSDataParameter(FTMSDataParameterName.totalDistance,
            FTMSDataFlag.totalDistanceFlag, 3, "metre", 1),
        const FTMSDataParameter(FTMSDataParameterName.resistanceLevel,
            FTMSDataFlag.resistanceLevelFlag, 2, "unitless", 1),
        const FTMSDataParameter(FTMSDataParameterName.instPower,
            FTMSDataFlag.instPowerFlag, 2, "watt", 1),
        const FTMSDataParameter(FTMSDataParameterName.avgPower,
            FTMSDataFlag.avgPowerFlag, 2, "watt", 1),
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

  IndoorBike(ftmsData) : super(ftmsData);
}
