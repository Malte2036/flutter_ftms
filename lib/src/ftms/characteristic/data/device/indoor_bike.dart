import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';

class IndoorBike extends DeviceData {
  @override
  DeviceDataType get deviceDataType => DeviceDataType.indoorBike;

  @override
  List<Flag> get allDeviceDataFlags => [
        DeviceDataFlag.moreDataFlag,
        DeviceDataFlag.avgSpeedFlag,
        DeviceDataFlag.instCadenceFlag,
        DeviceDataFlag.avgCadenceFlag,
        DeviceDataFlag.totalDistanceFlag,
        DeviceDataFlag.resistanceLevelFlag,
        DeviceDataFlag.instPowerFlag,
        DeviceDataFlag.avgPowerFlag,
        DeviceDataFlag.expendedEnergyFlag,
        DeviceDataFlag.heartRateFlag,
        DeviceDataFlag.metabolicEquivalentFlag,
        DeviceDataFlag.elapsedTimeFlag,
        DeviceDataFlag.remainingTimeFlag
      ];

  @override
  List<DeviceDataParameter> get allDeviceDataParameters => [
        const DeviceDataParameter(DeviceDataParameterName.instSpeed,
            DeviceDataFlag.moreDataFlag, 2, "Km/h", 0.01),
        const DeviceDataParameter(DeviceDataParameterName.avgSpeed,
            DeviceDataFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const DeviceDataParameter(DeviceDataParameterName.instCadence,
            DeviceDataFlag.instCadenceFlag, 2, "/min", 0.5),
        const DeviceDataParameter(DeviceDataParameterName.avgCadence,
            DeviceDataFlag.avgCadenceFlag, 2, "/min", 0.5),
        const DeviceDataParameter(DeviceDataParameterName.totalDistance,
            DeviceDataFlag.totalDistanceFlag, 3, "metre", 1),
        const DeviceDataParameter(DeviceDataParameterName.resistanceLevel,
            DeviceDataFlag.resistanceLevelFlag, 2, "unitless", 1),
        const DeviceDataParameter(DeviceDataParameterName.instPower,
            DeviceDataFlag.instPowerFlag, 2, "watt", 1),
        const DeviceDataParameter(DeviceDataParameterName.avgPower,
            DeviceDataFlag.avgPowerFlag, 2, "watt", 1),
        const DeviceDataParameter(DeviceDataParameterName.totalEnergy,
            DeviceDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const DeviceDataParameter(DeviceDataParameterName.energyPerHour,
            DeviceDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const DeviceDataParameter(DeviceDataParameterName.energyPerMinute,
            DeviceDataFlag.expendedEnergyFlag, 1, "kcal", 1),
        const DeviceDataParameter(DeviceDataParameterName.heartRate,
            DeviceDataFlag.heartRateFlag, 1, "Beats/m", 1),
        const DeviceDataParameter(DeviceDataParameterName.metabolicEquivalent,
            DeviceDataFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const DeviceDataParameter(DeviceDataParameterName.elapsedTime,
            DeviceDataFlag.elapsedTimeFlag, 2, "second", 1),
        const DeviceDataParameter(DeviceDataParameterName.remainingTime,
            DeviceDataFlag.remainingTimeFlag, 2, "second", 1),
      ];

  IndoorBike(super.ftmsData);
}
