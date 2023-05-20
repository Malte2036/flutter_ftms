import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/parameter_name.dart';

class DeviceDataParameterValue extends DeviceDataParameter {
  final int value;
  const DeviceDataParameterValue(
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
