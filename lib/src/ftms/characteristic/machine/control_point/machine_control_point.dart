import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/utils.dart';

class MachineControlPoint {
  late final MachineControlPointOpcode opCode;
  final MachineControlPointParameter? parameter;

  MachineControlPoint(
      MachineControlPointOpcodeType opcodeType, this.parameter) {
    opCode = MachineControlPointOpcode(opcodeType);
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
