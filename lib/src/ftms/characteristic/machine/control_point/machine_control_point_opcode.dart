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

  static const Map<int, MachineControlPointOpcodeType> _opcodeToOpcodeType = {
    0x0: MachineControlPointOpcodeType.requestControl,
    0x1: MachineControlPointOpcodeType.reset,
    //0x2: MachineControlPointOpcodeType.setTargetSpeed,
    //0x3: MachineControlPointOpcodeType.setTargetInclination,
    //0x4: MachineControlPointOpcodeType.setTargetResistanceLevel,
    //0x5: MachineControlPointOpcodeType.setTargetPower,
    //0x6: MachineControlPointOpcodeType.setTargetHearthRate,
    0x7: MachineControlPointOpcodeType.startOrResume,
    0x8: MachineControlPointOpcodeType.stopOrPause,
  };

  MachineControlPointOpcode.fromValue(this.value) {
    type = _valueToOpcodeType(value);
  }

  MachineControlPointOpcode(this.type) {
    value = _opcodeTypeToValue(type);
  }

  static MachineControlPointOpcodeType _valueToOpcodeType(int value) {
    if (!_opcodeToOpcodeType.containsKey(value)) {
      throw 'MachineControlPointOpcodeType for value $value not found!';
    }
    return _opcodeToOpcodeType[value]!;
  }

  static int _opcodeTypeToValue(MachineControlPointOpcodeType opcodeType) {
    if (!_opcodeToOpcodeType.containsValue(opcodeType)) {
      throw 'MachineControlPointOpcodeType for opcodeType $opcodeType not found!';
    }
    return _opcodeToOpcodeType.keys
        .firstWhere((k) => _opcodeToOpcodeType[k] == opcodeType);
  }
}
