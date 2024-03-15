import 'package:flutter_ftms/flutter_ftms.dart';

class DeviceDataParameterValue extends DeviceDataParameter {
  final int value;
  const DeviceDataParameterValue(
    super.name,
    super.flag,
    super.size,
    super.unit,
    super.factor,
    bool signed,
    this.value,
  ) : super(signed: signed);

  @override
  String toString() {
    return '${name.name}: ${(value * factor).toStringAsFixed(2)} $unit';
  }
}
