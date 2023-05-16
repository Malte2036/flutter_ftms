enum FTMSControlPointOpcodeType {
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

class FTMSControlPointOpcode {
  late final int value;
  late final FTMSControlPointOpcodeType type;

  FTMSControlPointOpcode.fromValue(this.value) {
    type = _valueToOpcodeType(value);
  }

  FTMSControlPointOpcode(this.type) {
    value = 1;
  }

  static FTMSControlPointOpcodeType _valueToOpcodeType(int value) {
    switch (value) {
      case 0x0:
        return FTMSControlPointOpcodeType.requestControl;
      case 0x1:
        return FTMSControlPointOpcodeType.reset;
      //case 0x2:
      //  return FTMSControlPointOpcodeType.setTargetSpeed;
      //case 0x3:
      //  return FTMSControlPointOpcodeType.setTargetInclination;
      //case 0x4:
      //  return FTMSControlPointOpcodeType.setTargetResistanceLevel;
      //case 0x5:
      //  return FTMSControlPointOpcodeType.setTargetPower;
      //case 0x6:
      //  return FTMSControlPointOpcodeType.setTargetHearthRate;
      case 0x7:
        return FTMSControlPointOpcodeType.startOrResume;
      case 0x8:
        return FTMSControlPointOpcodeType.stopOrPause;
      default:
        throw 'FTMSControlPointOpcodeType for value $value not found!';
    }
  }
}
