import 'package:flutter_ftms/src/ftms/flag.dart';

class FTMSFeatureFlag {
  static const Flag averageSpeedFlag = Flag("Average Speed Supported", 0);
  static const Flag cadenceFlag = Flag("Cadence Supported", 1);
  static const Flag totalDistanceFlag = Flag("Total Distance Supported", 2);
  static const Flag inclinationFlag = Flag("Inclination Supported", 3);
  static const Flag elevationGainFlag = Flag("Elevation Gain Supported", 4);
  static const Flag paceFlag = Flag("Pace Supported", 5);
  static const Flag stepCountFlag = Flag("Step Count Supported", 6);
  static const Flag resistanceLevelFlag = Flag("Resistance Level Supported", 7);
  static const Flag strideCountFlag = Flag("Stride Count Supported", 8);
  static const Flag expendedEnergyFlag = Flag("Expended Energy Supported", 9);
  static const Flag heartRateFlag =
      Flag("Heart Rate Measurement Supported", 10);
  static const Flag metabolicEquivalentFlag =
      Flag("Metabolic Equivalent Supported", 11);
  static const Flag elapsedTimeFlag = Flag("Elapsed Time Supported", 12);
  static const Flag remainingTimeFlag = Flag("Remaining Time Supported", 13);
  static const Flag powerMeasurementFlag =
      Flag("Power Measurement Supported", 14);
  static const Flag forceOnBeltAndPowerOutputFlag =
      Flag("Force on Belt and Power Output Supported", 15);
  static const Flag userDataRetentionFlag =
      Flag("User Data Retention Supported", 16);
}
