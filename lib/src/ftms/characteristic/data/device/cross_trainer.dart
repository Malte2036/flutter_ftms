import 'package:flutter_ftms/src/ftms/characteristic/data/device_data_flag.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/device_data.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/device_data_parameter.dart';
import 'package:flutter_ftms/src/ftms/characteristic/data/device_data_parameter_name.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';

class CrossTrainer extends DeviceData {
  @override
  DeviceDataType get deviceDataType => DeviceDataType.crossTrainer;

  @override
  List<Flag> get allDeviceDataFlags => [
        DeviceDataFlag.moreDataFlag,
        DeviceDataFlag.avgSpeedFlag,
        DeviceDataFlag.totalDistanceFlag,
        DeviceDataFlag.stepCountFlag,
        DeviceDataFlag.strideCountFlag,
        DeviceDataFlag.elevationGainFlag,
        DeviceDataFlag.inclinationAndRampAngleFlag,
        DeviceDataFlag.resistanceLevelFlag,
        DeviceDataFlag.instPowerFlag,
        DeviceDataFlag.avgPowerFlag,
        DeviceDataFlag.expendedEnergyFlag,
        DeviceDataFlag.heartRateFlag,
        DeviceDataFlag.metabolicEquivalentFlag,
        DeviceDataFlag.elapsedTimeFlag,
        DeviceDataFlag.remainingTimeFlag,
        DeviceDataFlag.movementDirectionFlag,
      ];

  @override
  List<DeviceDataParameter> get allDeviceDataParameters => [
        const DeviceDataParameter(
            DeviceDataParameterName.placeholder /* WHY? */, null, 1, "", 1),
        const DeviceDataParameter(DeviceDataParameterName.instSpeed,
            DeviceDataFlag.moreDataFlag, 2, "Km/h", 0.01),
        const DeviceDataParameter(DeviceDataParameterName.avgSpeed,
            DeviceDataFlag.avgSpeedFlag, 2, "Km/h", 0.01),
        const DeviceDataParameter(DeviceDataParameterName.totalDistance,
            DeviceDataFlag.totalDistanceFlag, 3, "metre", 1),
        const DeviceDataParameter(DeviceDataParameterName.stepPerMinute,
            DeviceDataFlag.stepCountFlag, 2, "step_per_minute", 1),
        const DeviceDataParameter(DeviceDataParameterName.avgStepRate,
            DeviceDataFlag.stepCountFlag, 2, "step_per_minute", 1),
        const DeviceDataParameter(DeviceDataParameterName.strideCount,
            DeviceDataFlag.strideCountFlag, 2, "" /*"unitless"*/, 1),
        const DeviceDataParameter(DeviceDataParameterName.inclination,
            DeviceDataFlag.inclinationAndRampAngleFlag, 2, "percent", 0.1),
        const DeviceDataParameter(DeviceDataParameterName.rampAngleSetting,
            DeviceDataFlag.inclinationAndRampAngleFlag, 2, "degree", 0.1),
        const DeviceDataParameter(DeviceDataParameterName.positiveElevationGain,
            DeviceDataFlag.elevationGainFlag, 2, "metre", 1),
        const DeviceDataParameter(DeviceDataParameterName.negativeElevationGain,
            DeviceDataFlag.elevationGainFlag, 2, "metre", 1),
        const DeviceDataParameter(DeviceDataParameterName.resistanceLevel,
            DeviceDataFlag.resistanceLevelFlag, 2, "" /*"unitless"*/, 0.1,
            signed: true),
        const DeviceDataParameter(DeviceDataParameterName.instPower,
            DeviceDataFlag.instPowerFlag, 2, "Watt", 1,
            signed: true),
        const DeviceDataParameter(DeviceDataParameterName.avgPower,
            DeviceDataFlag.avgPowerFlag, 2, "Watt", 1,
            signed: true),
        const DeviceDataParameter(DeviceDataParameterName.totalEnergy,
            DeviceDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const DeviceDataParameter(DeviceDataParameterName.energyPerHour,
            DeviceDataFlag.expendedEnergyFlag, 2, "kcal", 1),
        const DeviceDataParameter(DeviceDataParameterName.energyPerMinute,
            DeviceDataFlag.expendedEnergyFlag, 1, "kcal", 1),
        const DeviceDataParameter(DeviceDataParameterName.heartRate,
            DeviceDataFlag.heartRateFlag, 1, "beats/m", 1),
        const DeviceDataParameter(DeviceDataParameterName.metabolicEquivalent,
            DeviceDataFlag.metabolicEquivalentFlag, 1, "meta", 0.1),
        const DeviceDataParameter(DeviceDataParameterName.elapsedTime,
            DeviceDataFlag.elapsedTimeFlag, 2, "second", 1),
        const DeviceDataParameter(DeviceDataParameterName.remainingTime,
            DeviceDataFlag.remainingTimeFlag, 2, "second", 1),
      ];

  CrossTrainer(ftmsData) : super(ftmsData);
}
