import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/characteristic/parameter.dart';
import 'package:flutter_ftms/src/ftms/flag.dart';
import 'package:flutter_ftms/src/ftms/parameter_name.dart';

class DeviceDataParameter extends Parameter {
  final ParameterName name;
  final Flag? flag;

  const DeviceDataParameter(this.name, this.flag, size, unit, factor,
      {signed = false})
      : super(size, unit, factor, signed: signed);

  DeviceDataParameterValue toDeviceDataParameterValue(int value) {
    return DeviceDataParameterValue(
        name, flag, size, unit, factor, signed, value);
  }
}
