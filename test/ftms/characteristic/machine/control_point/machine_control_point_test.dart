import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test machine control point without parameter", () {
    var controlPoint = MachineControlPoint.startOrResume();

    expect(controlPoint.opCode.value, 0x7);
    expect(
        controlPoint.opCode.type, MachineControlPointOpcodeType.startOrResume);
    expect(controlPoint.getWriteData(), [0x7]);
  });

  test("test machine control point with parameter", () {
    var controlPoint = MachineControlPoint.stopOrPause(pause: true);

    expect(controlPoint.opCode.value, 0x8);
    expect(controlPoint.opCode.type, MachineControlPointOpcodeType.stopOrPause);
    expect(controlPoint.getWriteData(), [0x8, 0x2]);
  });
}
