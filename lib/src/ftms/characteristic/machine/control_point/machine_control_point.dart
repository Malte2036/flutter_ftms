import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/characteristic/machine/control_point/machine_control_point_parameter.dart';
import 'package:flutter_ftms/src/utils.dart';

class MachineControlPoint {
  late final MachineControlPointOpcode opCode;
  final MachineControlPointParameter? parameter;

  MachineControlPoint._internal(
      MachineControlPointOpcodeType opcodeType, this.parameter) {
    opCode = MachineControlPointOpcode(opcodeType);
  }

  factory MachineControlPoint.requestControl() {
    return MachineControlPoint._internal(
        MachineControlPointOpcodeType.requestControl, null);
  }

  factory MachineControlPoint.reset() {
    return MachineControlPoint._internal(
        MachineControlPointOpcodeType.reset, null);
  }

  factory MachineControlPoint.startOrResume() {
    return MachineControlPoint._internal(
        MachineControlPointOpcodeType.startOrResume, null);
  }

  /// MachineControlPoint.stopOrPause
  ///
  /// @pause true if you want pause. false if you want to stop.
  factory MachineControlPoint.stopOrPause({required bool pause}) {
    return MachineControlPoint._internal(
        MachineControlPointOpcodeType.stopOrPause,
        MachineControlPointParameter.stopOrPause(pause: pause));
  }

  factory MachineControlPoint.setTargetSpeed({required int speed}) {
    return MachineControlPoint._internal(
        MachineControlPointOpcodeType.setTargetSpeed,
        MachineControlPointParameter.setTargetSpeed(speed: speed));
  }

  factory MachineControlPoint.setTargetInclination({required int inclination}) {
    return MachineControlPoint._internal(
        MachineControlPointOpcodeType.setTargetInclination,
        MachineControlPointParameter.setTargetInclination(
            inclination: inclination));
  }

  factory MachineControlPoint.setTargetResistanceLevel(
      {required int resistanceLevel}) {
    return MachineControlPoint._internal(
        MachineControlPointOpcodeType.setTargetResistanceLevel,
        MachineControlPointParameter.setTargetResistanceLevel(
            resistanceLevel: resistanceLevel));
  }

  factory MachineControlPoint.setTargetPower({required int power}) {
    return MachineControlPoint._internal(
        MachineControlPointOpcodeType.setTargetPower,
        MachineControlPointParameter.setTargetPower(power: power));
  }

  factory MachineControlPoint.setTargetHeartRate({required int heartRate}) {
    return MachineControlPoint._internal(
        MachineControlPointOpcodeType.setTargetHeartRate,
        MachineControlPointParameter.setTargetHeartRate(heartRate: heartRate));
  }

  List<int> getWriteData() {
    List<int> writeData = [opCode.value];
    if (parameter != null) {
      writeData.addAll(
          Utils.intToLittleEndianArray(parameter!.value, parameter!.size));
    }
    return writeData;
  }
}
