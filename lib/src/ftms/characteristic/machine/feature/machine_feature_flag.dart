import 'package:flutter_ftms/src/ftms/flag.dart';

class MachineFeatureFlag {
  static const Flag averageSpeedFlag = Flag("Average Speed Supported");
  static const Flag cadenceFlag = Flag("Cadence Supported");
  static const Flag totalDistanceFlag = Flag("Total Distance Supported");
  static const Flag inclinationFlag = Flag("Inclination Supported");
  static const Flag elevationGainFlag = Flag("Elevation Gain Supported");
  static const Flag paceFlag = Flag("Pace Supported");
  static const Flag stepCountFlag = Flag("Step Count Supported");
  static const Flag resistanceLevelFlag = Flag("Resistance Level Supported");
  static const Flag strideCountFlag = Flag("Stride Count Supported");
  static const Flag expendedEnergyFlag = Flag("Expended Energy Supported");
  static const Flag heartRateFlag = Flag("Heart Rate Measurement Supported");
  static const Flag metabolicEquivalentFlag =
      Flag("Metabolic Equivalent Supported");
  static const Flag elapsedTimeFlag = Flag("Elapsed Time Supported");
  static const Flag remainingTimeFlag = Flag("Remaining Time Supported");
  static const Flag powerMeasurementFlag = Flag("Power Measurement Supported");
  static const Flag forceOnBeltAndPowerOutputFlag =
      Flag("Force on Belt and Power Output Supported");
  static const Flag userDataRetentionFlag =
      Flag("User Data Retention Supported");
}
