import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';

class Treadmill extends DeviceData {
  @override
  List<Flag> get allDeviceDataFlags => [
        DeviceDataFlag.moreDataFlag,
        DeviceDataFlag.avgSpeedFlag,
        DeviceDataFlag.totalDistanceFlag,
        DeviceDataFlag.inclinationAndRampAngleFlag,
        DeviceDataFlag.elevationGainFlag,
        DeviceDataFlag.instPaceFlag,
        DeviceDataFlag.avgPaceFlag,
        DeviceDataFlag.expendedEnergyFlag,
        DeviceDataFlag.heartRateFlag,
        DeviceDataFlag.metabolicEquivalentFlag,
        DeviceDataFlag.elapsedTimeFlag,
        DeviceDataFlag.remainingTimeFlag,
        DeviceDataFlag.forceOnBeltAndPowerOutputFlag
      ];

  @override
  List<DeviceDataParameter> get allDeviceDataParameters => [
        const DeviceDataParameter(DeviceDataParameterName.instSpeed,
            DeviceDataFlag.moreDataFlag, 2, "Km/h", 0.01),
        const DeviceDataParameter(DeviceDataParameterName.avgSpeed,
            DeviceDataFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const DeviceDataParameter(DeviceDataParameterName.totalDistance,
            DeviceDataFlag.totalDistanceFlag, 3, "metre", 1),
        const DeviceDataParameter(DeviceDataParameterName.inclination,
            DeviceDataFlag.inclinationAndRampAngleFlag, 2, "percent", 0.1),
        const DeviceDataParameter(DeviceDataParameterName.rampAngleSetting,
            DeviceDataFlag.inclinationAndRampAngleFlag, 2, "degree", 0.1),
        const DeviceDataParameter(DeviceDataParameterName.positiveElevationGain,
            DeviceDataFlag.elevationGainFlag, 2, "metre", 0.1),
        const DeviceDataParameter(DeviceDataParameterName.negativeElevationGain,
            DeviceDataFlag.elevationGainFlag, 2, "metre", 0.1),
        const DeviceDataParameter(DeviceDataParameterName.instPace,
            DeviceDataFlag.instPaceFlag, 1, "Km/m", 0.1),
        const DeviceDataParameter(DeviceDataParameterName.avgPace,
            DeviceDataFlag.avgPaceFlag, 1, "Km/m", 0.1),
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
        const DeviceDataParameter(DeviceDataParameterName.forceOnBelt,
            DeviceDataFlag.forceOnBeltAndPowerOutputFlag, 2, "newton", 1),
        const DeviceDataParameter(DeviceDataParameterName.powerOutput,
            DeviceDataFlag.forceOnBeltAndPowerOutputFlag, 2, "watt", 1),
      ];

  @override
  DeviceDataType get deviceDataType => DeviceDataType.treadmill;

  Treadmill(super.ftmsData);
}
