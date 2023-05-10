import 'package:flutter_ftms/src/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("dataToBinaryFlags", () {
    expect(dataToBinaryFlags([68, 0]), ("1000100".padLeft(16, "0")));
  });
}
