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

  test("test machine control point with Target Power", () {
    var controlPoint = MachineControlPoint.setTargetPower(power: 300);

    expect(controlPoint.opCode.value, 0x5);
    expect(controlPoint.opCode.type, MachineControlPointOpcodeType.setTargetPower);
    expect(controlPoint.getWriteData(), [0x5, 0x2C,0x01]);
  });
}
