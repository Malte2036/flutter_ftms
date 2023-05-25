import 'dart:async';

import 'package:flutter_ftms/flutter_ftms.dart';

class FTMSBloc {
  final StreamController<DeviceData?> _ftmsDeviceDataController =
      StreamController<DeviceData?>.broadcast();

  StreamSink<DeviceData?> get ftmsDeviceDataControllerSink =>
      _ftmsDeviceDataController.sink;
  Stream<DeviceData?> get ftmsDeviceDataControllerStream =>
      _ftmsDeviceDataController.stream;

  final StreamController<MachineFeature?> _ftmsMachineFeaturesController =
      StreamController<MachineFeature?>.broadcast();

  StreamSink<MachineFeature?> get ftmsMachineFeaturesControllerSink =>
      _ftmsMachineFeaturesController.sink;
  Stream<MachineFeature?> get ftmsMachineFeaturesControllerStream =>
      _ftmsMachineFeaturesController.stream;
}

final FTMSBloc ftmsBloc = FTMSBloc();
