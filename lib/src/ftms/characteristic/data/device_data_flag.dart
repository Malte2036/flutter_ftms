import 'package:flutter_ftms/src/ftms/flag.dart';

class DeviceDataFlag {
  static const Flag moreDataFlag = Flag("More Data");
  static const Flag avgSpeedFlag = Flag("Average Speed");
  static const Flag totalDistanceFlag = Flag("Total Distance");
  static const Flag stepCountFlag = Flag("Step Count");
  static const Flag strideCountFlag = Flag("Stride Count");
  static const Flag elevationGainFlag = Flag("Elevation Gain");
  static const Flag inclinationAndRampAngleFlag =
      Flag("Inclination and Ramp Angle Setting");
  static const Flag resistanceLevelFlag = Flag("Resistance Level");
  static const Flag instPowerFlag = Flag("Instantaneous Power");
  static const Flag avgPowerFlag = Flag("Average Power");
  static const Flag expendedEnergyFlag = Flag("Expended Energy");
  static const Flag heartRateFlag = Flag("Heart Rate");
  static const Flag metabolicEquivalentFlag = Flag("Metabolic Equivalent");
  static const Flag elapsedTimeFlag = Flag("Elapsed Time");
  static const Flag remainingTimeFlag = Flag("Remaining Time");
  static const Flag movementDirectionFlag = Flag("Movement Direction");

  static const Flag instCadenceFlag = Flag("Instantaneous Cadence");
  static const Flag avgCadenceFlag = Flag("Average Cadence");

  static const Flag instPaceFlag = Flag("Instantaneous Pace");
  static const Flag avgPaceFlag = Flag("Average Pace");
  static const Flag forceOnBeltAndPowerOutputFlag =
      Flag("Force on Belt and Power Output");

  static const Flag avgStrokeFlag = Flag("Average Stroke");
}
