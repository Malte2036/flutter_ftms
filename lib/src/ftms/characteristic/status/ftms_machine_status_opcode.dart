enum FTMSMachineStatusOpcodeType {
  reset,
  stoppedOrPausedByUser,
  stoppedBySafetyKey,
  startedOrResumedByUser,
  targetSpeedChanged,
  targetInclineChanged,
  targetResistanceLevelChanged,
  targetPowerChanged,
  targetHearthRateChanged,
  targetedExpendedEnergyChanged,
  targetedNumberOfStepsChanged,
  targetedNumberOfStridesChanged,
  targetedDistanceChanged,
  targetedTrainingTimeChanged
}

class FTMSMachineStatusOpcode {
  final int value;
  late final FTMSMachineStatusOpcodeType type;

  FTMSMachineStatusOpcode(this.value) {
    type = _valueToOpcodeType(value);
  }

  static FTMSMachineStatusOpcodeType _valueToOpcodeType(int value) {
    switch (value) {
      case 0x1:
        return FTMSMachineStatusOpcodeType.reset;
      case 0x2:
        return FTMSMachineStatusOpcodeType.stoppedOrPausedByUser;
      case 0x3:
        return FTMSMachineStatusOpcodeType.stoppedBySafetyKey;
      case 0x4:
        return FTMSMachineStatusOpcodeType.startedOrResumedByUser;
      case 0x5:
        return FTMSMachineStatusOpcodeType.targetSpeedChanged;
      case 0x6:
        return FTMSMachineStatusOpcodeType.targetInclineChanged;
      case 0x7:
        return FTMSMachineStatusOpcodeType.targetResistanceLevelChanged;
      case 0x8:
        return FTMSMachineStatusOpcodeType.targetPowerChanged;
      case 0x9:
        return FTMSMachineStatusOpcodeType.targetHearthRateChanged;
      case 0xA:
        return FTMSMachineStatusOpcodeType.targetedExpendedEnergyChanged;
      case 0xB:
        return FTMSMachineStatusOpcodeType.targetedNumberOfStepsChanged;
      case 0xC:
        return FTMSMachineStatusOpcodeType.targetedNumberOfStridesChanged;
      case 0xD:
        return FTMSMachineStatusOpcodeType.targetedDistanceChanged;
      case 0xE:
        return FTMSMachineStatusOpcodeType.targetedTrainingTimeChanged;
      default:
        throw 'FTMSMachineStatusOpcodeType for value $value not found!';
    }
  }
}
