import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/characteristic/parameter.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/parameter_name.dart';

class FTMSDataParameter extends Parameter {
  final ParameterName name;
  final Flag? flag;

  const FTMSDataParameter(this.name, this.flag, size, unit, factor,
      {signed = false})
      : super(size, unit, factor, signed: signed);

  FTMSDataParameterValue toFTMSDataParameterValue(int value) {
    return FTMSDataParameterValue(
        name, flag, size, unit, factor, signed, value);
  }
}
