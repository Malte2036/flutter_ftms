import 'package:flutter_ftms/src/ftms/flag.dart';

class TrainingStatusType {
  static const Flag other = Flag("Other");
  static const Flag idle = Flag("Idle");
  static const Flag warmingUp = Flag("Warming Up");
  static const Flag lowIntensityInterval = Flag("Low Intensity Interval");
  static const Flag highIntensityInterval = Flag("High Intensity Interval");
  static const Flag recoveryInterval = Flag("Recovery Interval");
  static const Flag isometric = Flag("Isometric");
  static const Flag heartRateControl = Flag("Heart Rate Control");
  static const Flag fitnessTest = Flag("Fitness Test");
  static const Flag speedLow = Flag(
      "Speed Outside of Control Region - Low (increase speed to return to controllable region)");
  static const Flag speedHigh = Flag(
      "Speed Outside of Control Region - High (decrease speed to return to controllable region)");
  static const Flag coolDown = Flag("Cool Down");
  static const Flag wattControl = Flag("Watt Control");
  static const Flag manualMode = Flag("Manual Mode (Quick Start)");
  static const Flag preWorkout = Flag("Pre-Workout");
  static const Flag postWorkout = Flag("Post-Workout");
  static const Flag reserved = Flag("Reserved for Future Use");
}
