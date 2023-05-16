import 'package:flutter_ftms/flutter_ftms.dart';

class FTMSControlPoint {
  late final FTMSControlPointOpcode opCode;

  FTMSControlPoint(FTMSControlPointOpcodeType opcodeType) {
    opCode = FTMSControlPointOpcode(opcodeType);
  }
}
