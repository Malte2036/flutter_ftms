import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/characteristic/machine/status/machine_status_parameter.dart';
import 'package:flutter_ftms/src/utils.dart';

class MachineStatus {
  late final MachineStatusOpcode opCode;
  late final MachineStatusParameterValue? parameter;

  static final Map<MachineStatusOpcodeType, MachineStatusParameter>
      _opcodesWithParameters = {
    MachineStatusOpcodeType.stoppedOrPausedByUser:
        const MachineStatusParameter(1, "", 1),
    MachineStatusOpcodeType.targetSpeedChanged:
        const MachineStatusParameter(2, "Km/h", 0.01),
    MachineStatusOpcodeType.targetInclineChanged:
        const MachineStatusParameter(2, "%", 0.1, signed: true),
    MachineStatusOpcodeType.targetResistanceLevelChanged:
        const MachineStatusParameter(1, "", 0.1),
    MachineStatusOpcodeType.targetPowerChanged:
        const MachineStatusParameter(2, "Watt", 1, signed: true),
    MachineStatusOpcodeType.targetHearthRateChanged:
        const MachineStatusParameter(1, "bpm", 1),
    MachineStatusOpcodeType.targetedExpendedEnergyChanged:
        const MachineStatusParameter(2, "Calories", 1),
    MachineStatusOpcodeType.targetedNumberOfStepsChanged:
        const MachineStatusParameter(2, "Steps", 1),
    MachineStatusOpcodeType.targetedNumberOfStridesChanged:
        const MachineStatusParameter(2, "Stride", 1),
    MachineStatusOpcodeType.targetedDistanceChanged:
        const MachineStatusParameter(3, "meters", 1),
    MachineStatusOpcodeType.targetedTrainingTimeChanged:
        const MachineStatusParameter(2, "Seconds", 1),
  };

  MachineStatus(List<int> data) {
    if (data.isEmpty) {
      throw 'MachineStatus data should not be empty!';
    }
    opCode = MachineStatusOpcode(data[0]);

    if (_opcodesWithParameters.containsKey(opCode.type)) {
      var p = _opcodesWithParameters[opCode.type]!;
      var parameterData = data.getRange(1, 1 + p.size).toList();
      parameterData = List.from(parameterData.reversed);
      //print(data.getRange(1, 1 + p.size + 1).toList());
      var value = Utils.readAndConvertLittleEndianValue(parameterData, p);
      parameter = p.toMachineStatusParameterValue(value);
    }
  }
}
