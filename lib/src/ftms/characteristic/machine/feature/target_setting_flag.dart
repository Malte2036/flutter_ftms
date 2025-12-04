import 'package:flutter_ftms/src/ftms/flag.dart';

class TargetSettingFlag {
  static const Flag speedTargetSettingFlag = Flag("Speed Target Setting Supported");
  static const Flag inclinationTargetSettingFlag = Flag("Inclination Target Setting Supported");
  static const Flag resistanceTargetSettingFlag = Flag("Resistance Target Setting Supported");
  static const Flag powerTargetSettingFlag = Flag("Power Target Setting Supported");
  static const Flag heartRateTargetSettingFlag = Flag("Heart Rate Target Setting Supported");
  static const Flag targetedExpendedEnergyFlag = Flag("Targeted Expended Energy Configuration Supported");
  static const Flag targetedStepNumberFlag = Flag("Targeted Step Number Configuration Supported");
  static const Flag targetedStrideNumberFlag = Flag("Targeted Stride Number Configuration Supported");
  static const Flag targetedDistanceFlag = Flag("Targeted Distance Configuration Supported");
  static const Flag targetedTrainingTimeFlag = Flag("Targeted Training Time Configuration Supported");
  static const Flag targetedTimeInTwoHeartRateZonesFlag = Flag("Targeted Time in Two Heart Rate Zones Configuration Supported");
  static const Flag targetedTimeInThreeHeartRateZonesFlag = Flag("Targeted Time in Three Heart Rate Zones Configuration Supported");
  static const Flag targetedTimeInFiveHeartRateZonesFlag = Flag("Targeted Time in Five Heart Rate Zones Configuration Supported");
  static const Flag indoorBikeSimulationParametersFlag = Flag("Indoor Bike Simulation Parameters Supported");
  static const Flag wheelCircumferenceConfigurationFlag = Flag("Wheel Circumference Configuration Supported");
  static const Flag spinDownControlFlag = Flag("Spin Down Control Supported");
  static const Flag targetedCadenceFlag = Flag("Targeted Cadence Configuration Supported");
  // Bits 17-31 are reserved for future use
}
