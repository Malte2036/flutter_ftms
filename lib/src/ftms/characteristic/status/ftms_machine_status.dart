import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms/src/ftms/characteristic/status/ftms_machine_status_opcode.dart';
import 'package:flutter_ftms/src/ftms/characteristic/status/ftms_machine_status_parameter.dart';
import 'package:flutter_ftms/src/utils.dart';

class FTMSMachineStatus {
  late final FTMSMachineStatusOpcode opCode;
  late final FTMSMachineStatusParameterValue? parameter;

  static final Map<FTMSMachineStatusOpcodeType, FTMSMachineStatusParameter>
      _opcodesWithParameters = {
    FTMSMachineStatusOpcodeType.stoppedOrPausedByUser:
        const FTMSMachineStatusParameter(1, "", 1),
    FTMSMachineStatusOpcodeType.targetSpeedChanged:
        const FTMSMachineStatusParameter(2, "Km/h", 0.01),
    FTMSMachineStatusOpcodeType.targetInclineChanged:
        const FTMSMachineStatusParameter(2, "%", 0.1, signed: true),
    FTMSMachineStatusOpcodeType.targetResistanceLevelChanged:
        const FTMSMachineStatusParameter(1, "", 0.1),
    FTMSMachineStatusOpcodeType.targetPowerChanged:
        const FTMSMachineStatusParameter(2, "Watt", 1, signed: true),
    FTMSMachineStatusOpcodeType.targetHearthRateChanged:
        const FTMSMachineStatusParameter(1, "bpm", 1),
    FTMSMachineStatusOpcodeType.targetedExpendedEnergyChanged:
        const FTMSMachineStatusParameter(2, "Calories", 1),
    FTMSMachineStatusOpcodeType.targetedNumberOfStepsChanged:
        const FTMSMachineStatusParameter(2, "Steps", 1),
    FTMSMachineStatusOpcodeType.targetedNumberOfStridesChanged:
        const FTMSMachineStatusParameter(2, "Stride", 1),
    FTMSMachineStatusOpcodeType.targetedDistanceChanged:
        const FTMSMachineStatusParameter(3, "meters", 1),
    FTMSMachineStatusOpcodeType.targetedTrainingTimeChanged:
        const FTMSMachineStatusParameter(2, "Seconds", 1),
  };

  FTMSMachineStatus(List<int> data) {
    if (data.isEmpty) {
      throw 'FTMSMachineStatus should not be empty!';
    }
    opCode = FTMSMachineStatusOpcode(data[0]);

    if (_opcodesWithParameters.containsKey(opCode.type)) {
      var p = _opcodesWithParameters[opCode.type]!;
      var parameterData = data.getRange(1, 1 + p.size).toList();
      parameterData = List.from(parameterData.reversed);
      //print(data.getRange(1, 1 + p.size + 1).toList());
      var value = Utils.readAndConvertLittleEndianValue(parameterData, p);
      parameter = p.toFTMSDataParameterValue(value);
    }
  }
}
