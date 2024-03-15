import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/characteristic/parameter.dart';

class MachineStatusParameter extends Parameter {
  const MachineStatusParameter(super.size, super.unit, super.factor,
      {super.signed = false});

  MachineStatusParameterValue toMachineStatusParameterValue(int value) {
    return MachineStatusParameterValue(size, unit, factor, signed, value);
  }
}
