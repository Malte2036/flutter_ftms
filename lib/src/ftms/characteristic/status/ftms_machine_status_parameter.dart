import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/characteristic/parameter.dart';

class FTMSMachineStatusParameter extends Parameter {
  const FTMSMachineStatusParameter(size, unit, factor, {signed = false})
      : super(size, unit, factor, signed: signed);

  FTMSMachineStatusParameterValue toFTMSMachineStatusParameterValue(int value) {
    return FTMSMachineStatusParameterValue(size, unit, factor, signed, value);
  }
}
