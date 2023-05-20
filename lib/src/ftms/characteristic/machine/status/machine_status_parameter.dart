import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/characteristic/parameter.dart';

class MachineStatusParameter extends Parameter {
  const MachineStatusParameter(size, unit, factor, {signed = false})
      : super(size, unit, factor, signed: signed);

  MachineStatusParameterValue toMachineStatusParameterValue(int value) {
    return MachineStatusParameterValue(size, unit, factor, signed, value);
  }
}
