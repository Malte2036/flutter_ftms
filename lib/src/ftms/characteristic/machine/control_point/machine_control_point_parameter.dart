import 'package:flutter_ftms/src/ftms/characteristic/parameter.dart';

class MachineControlPointParameter extends Parameter {
  final int value;

  MachineControlPointParameter._internal(
      this.value, int size, String unit, num factor,
      {bool signed = false})
      : super(size, unit, factor, signed: signed);

  factory MachineControlPointParameter.setTargetSpeed({required int speed}) {
    return MachineControlPointParameter._internal(speed, 2, "Km/h", 0.01,
        signed: false);
  }

  factory MachineControlPointParameter.setTargetInclination(
      {required int inclination}) {
    return MachineControlPointParameter._internal(inclination, 2, "%", 0.1,
        signed: true);
  }

  factory MachineControlPointParameter.setTargetResistanceLevel(
      {required int resistanceLevel}) {
    return MachineControlPointParameter._internal(resistanceLevel, 1, "", 0.1,
        signed: false);
  }

  factory MachineControlPointParameter.setTargetPower({required int power}) {
    return MachineControlPointParameter._internal(power, 2, "watt", 1,
        signed: true);
  }

  factory MachineControlPointParameter.setTargetHeartRate(
      {required int heartRate}) {
    return MachineControlPointParameter._internal(heartRate, 1, "bpm", 1,
        signed: false);
  }

  /// MachineControlPointParameter.stopOrPause
  ///
  /// @pause true if you want pause. false if you want to stop.
  factory MachineControlPointParameter.stopOrPause({required bool pause}) {
    return MachineControlPointParameter._internal(pause ? 0x2 : 0x1, 1, "", 1);
  }
}
