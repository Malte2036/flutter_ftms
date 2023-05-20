enum MachineControlPointOpcodeType {
  requestControl,
  reset,
  //setTargetSpeed,
  //setTargetInclination,
  //setTargetResistanceLevel,
  //setTargetPower,
  //setTargetHearthRate,
  startOrResume,
  stopOrPause,
  /* TODO: add more */
}

class MachineControlPointOpcode {
  late final int value;
  late final MachineControlPointOpcodeType type;

  MachineControlPointOpcode.fromValue(this.value) {
    type = _valueToOpcodeType(value);
  }

  MachineControlPointOpcode(this.type) {
    value = 1;
  }

  static MachineControlPointOpcodeType _valueToOpcodeType(int value) {
    switch (value) {
      case 0x0:
        return MachineControlPointOpcodeType.requestControl;
      case 0x1:
        return MachineControlPointOpcodeType.reset;
      //case 0x2:
      //  return MachineControlPointOpcodeType.setTargetSpeed;
      //case 0x3:
      //  return MachineControlPointOpcodeType.setTargetInclination;
      //case 0x4:
      //  return MachineControlPointOpcodeType.setTargetResistanceLevel;
      //case 0x5:
      //  return MachineControlPointOpcodeType.setTargetPower;
      //case 0x6:
      //  return MachineControlPointOpcodeType.setTargetHearthRate;
      case 0x7:
        return MachineControlPointOpcodeType.startOrResume;
      case 0x8:
        return MachineControlPointOpcodeType.stopOrPause;
      default:
        throw 'MachineControlPointOpcodeType for value $value not found!';
    }
  }
}
