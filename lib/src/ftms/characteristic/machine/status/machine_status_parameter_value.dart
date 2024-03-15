import 'package:flutter_ftms/src/ftms/characteristic/machine/status/machine_status_parameter.dart';

class MachineStatusParameterValue extends MachineStatusParameter {
  final int value;

  const MachineStatusParameterValue(
    super.size,
    super.unit,
    super.factor,
    bool signed,
    this.value,
  ) : super(signed: signed);
}
