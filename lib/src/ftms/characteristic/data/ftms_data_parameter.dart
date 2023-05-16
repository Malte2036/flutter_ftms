import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/parameter_name.dart';

class FTMSDataParameter {
  final ParameterName name;
  final Flag? flag;
  final String unit;
  final num factor;
  final int size;
  final bool signed;

  const FTMSDataParameter(
      this.name, this.flag, this.size, this.unit, this.factor,
      {this.signed = false});

  FTMSDataParameterValue toFTMSDataParameterValue(int value) {
    return FTMSDataParameterValue(
        name, flag, size, unit, factor, signed, value);
  }
}
