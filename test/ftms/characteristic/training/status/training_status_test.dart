import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("test training status features", () {
    List<int> data = [0x1];
    var trainingStatus = TrainingStatus(data);
    var features = trainingStatus.getFeatures();

    expect(features[TrainingStatusFlag.trainingStatusStringPresent], true);
    expect(features[TrainingStatusFlag.extendedStringPresent], false);
  });
  test("test training status type", () {
    List<int> data = [0x1, 0x8];
    var trainingStatus = TrainingStatus(data);
    var type = trainingStatus.getTrainingStatusType();

    expect(type, TrainingStatusType.fitnessTest);
  });
}
