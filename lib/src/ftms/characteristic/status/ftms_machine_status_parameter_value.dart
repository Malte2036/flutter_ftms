import 'package:flutter_ftms/src/ftms/characteristic/status/ftms_machine_status_parameter.dart';

class FTMSMachineStatusParameterValue extends FTMSMachineStatusParameter {
  final int value;

  const FTMSMachineStatusParameterValue(
    int size,
    String unit,
    num factor,
    bool signed,
    this.value,
  ) : super(size, unit, factor, signed: signed);
}
