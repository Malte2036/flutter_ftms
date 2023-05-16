import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/parameter_name.dart';

class FTMSDataParameterValue extends FTMSDataParameter {
  final int value;
  const FTMSDataParameterValue(
    ParameterName name,
    Flag? flag,
    int size,
    String unit,
    num factor,
    bool signed,
    this.value,
  ) : super(name, flag, size, unit, factor, signed: signed);

  @override
  String toString() {
    return '${name.name}: ${(value * factor).toStringAsFixed(2)} $unit';
  }
}
