import 'package:flutter_ftms/src/ftms/characteristic/machine/status/machine_status_parameter.dart';

class MachineStatusParameterValue extends MachineStatusParameter {
  final int value;

  const MachineStatusParameterValue(
    int size,
    String unit,
    num factor,
    bool signed,
    this.value,
  ) : super(size, unit, factor, signed: signed);
}
