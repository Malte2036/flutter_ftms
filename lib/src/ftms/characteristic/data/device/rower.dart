import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';

class Rower extends DeviceData {
  Rower(super.ftmsData);

  @override
  List<Flag> get allDeviceDataFlags => [
        DeviceDataFlag.moreDataFlag,
        DeviceDataFlag.avgStrokeFlag,
        DeviceDataFlag.totalDistanceFlag,
        DeviceDataFlag.instPaceFlag,
        DeviceDataFlag.avgPaceFlag,
        DeviceDataFlag.instPowerFlag,
        DeviceDataFlag.avgPowerFlag,
        DeviceDataFlag.resistanceLevelFlag,
        DeviceDataFlag.expendedEnergyFlag,
        DeviceDataFlag.heartRateFlag,
        DeviceDataFlag.metabolicEquivalentFlag,
        DeviceDataFlag.elapsedTimeFlag,
        DeviceDataFlag.remainingTimeFlag
      ];

  @override
  List<DeviceDataParameter> get allDeviceDataParameters => [
        const DeviceDataParameter(
            DeviceDataParameterName.strokeRate, null, 1, "stroke/min", 0.5),
        const DeviceDataParameter(
            DeviceDataParameterName.strokeCount, null, 2, "", 1),
        const DeviceDataParameter(DeviceDataParameterName.avgStrokeRate,
            DeviceDataFlag.avgStrokeFlag, 1, "stroke/min", 0.5),
        const DeviceDataParameter(DeviceDataParameterName.totalDistance,
            DeviceDataFlag.totalDistanceFlag, 3, "metre", 1),
        const DeviceDataParameter(DeviceDataParameterName.instPace,
            DeviceDataFlag.instPaceFlag, 2, "Seconds(500m)", 1),
        const DeviceDataParameter(DeviceDataParameterName.avgPace,
            DeviceDataFlag.avgPaceFlag, 2, "Seconds(500m)", 1),
        const DeviceDataParameter(DeviceDataParameterName.instPower,
            DeviceDataFlag.instPowerFlag, 2, "watt", 1),
        const DeviceDataParameter(DeviceDataParameterName.avgPower,
            DeviceDataFlag.avgPowerFlag, 2, "watt", 1),
        const DeviceDataParameter(DeviceDataParameterName.resistanceLevel,
            DeviceDataFlag.resistanceLevelFlag, 2, "", 1),
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

  @override
  DeviceDataType get deviceDataType => DeviceDataType.rower;
}
