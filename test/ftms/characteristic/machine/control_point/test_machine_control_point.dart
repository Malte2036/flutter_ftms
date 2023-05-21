import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("machine control point test", () {
    var controlPoint =
        MachineControlPoint(MachineControlPointOpcodeType.stopOrPause);

    expect(controlPoint.opCode.value, 0x8);
    expect(controlPoint.opCode.type, MachineControlPointOpcodeType.stopOrPause);
  });
}
