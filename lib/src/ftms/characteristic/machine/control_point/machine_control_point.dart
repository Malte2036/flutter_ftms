import 'package:flutter_ftms/flutter_ftms.dart';

class MachineControlPoint {
  late final MachineControlPointOpcode opCode;

  MachineControlPoint(MachineControlPointOpcodeType opcodeType) {
    opCode = MachineControlPointOpcode(opcodeType);
  }
}
