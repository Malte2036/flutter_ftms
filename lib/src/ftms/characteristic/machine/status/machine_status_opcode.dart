enum MachineStatusOpcodeType {
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

class MachineStatusOpcode {
  final int value;
  late final MachineStatusOpcodeType type;

  MachineStatusOpcode(this.value) {
    type = _valueToOpcodeType(value);
  }

  static MachineStatusOpcodeType _valueToOpcodeType(int value) {
    switch (value) {
      case 0x1:
        return MachineStatusOpcodeType.reset;
      case 0x2:
        return MachineStatusOpcodeType.stoppedOrPausedByUser;
      case 0x3:
        return MachineStatusOpcodeType.stoppedBySafetyKey;
      case 0x4:
        return MachineStatusOpcodeType.startedOrResumedByUser;
      case 0x5:
        return MachineStatusOpcodeType.targetSpeedChanged;
      case 0x6:
        return MachineStatusOpcodeType.targetInclineChanged;
      case 0x7:
        return MachineStatusOpcodeType.targetResistanceLevelChanged;
      case 0x8:
        return MachineStatusOpcodeType.targetPowerChanged;
      case 0x9:
        return MachineStatusOpcodeType.targetHearthRateChanged;
      case 0xA:
        return MachineStatusOpcodeType.targetedExpendedEnergyChanged;
      case 0xB:
        return MachineStatusOpcodeType.targetedNumberOfStepsChanged;
      case 0xC:
        return MachineStatusOpcodeType.targetedNumberOfStridesChanged;
      case 0xD:
        return MachineStatusOpcodeType.targetedDistanceChanged;
      case 0xE:
        return MachineStatusOpcodeType.targetedTrainingTimeChanged;
      default:
        throw 'MachineStatusOpcodeType for value $value not found!';
    }
  }
}
