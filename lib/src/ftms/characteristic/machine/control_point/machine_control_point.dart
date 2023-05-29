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

  List<int> getWriteData() {
    List<int> writeData = [opCode.value];
    if (parameter != null) {
      writeData.addAll(
          Utils.intToLittleEndianArray(parameter!.value, parameter!.size));
    }
    return writeData;
  }
}
