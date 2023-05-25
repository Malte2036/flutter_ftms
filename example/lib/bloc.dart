import 'dart:async';

import 'package:flutter_ftms/flutter_ftms.dart';

class FTMSBloc {
  final StreamController<DeviceData?> _ftmsDeviceDataController =
      StreamController<DeviceData?>.broadcast();

  StreamSink<DeviceData?> get ftmsDeviceDataControllerSink =>
      _ftmsDeviceDataController.sink;
  Stream<DeviceData?> get ftmsDeviceDataControllerStream =>
      _ftmsDeviceDataController.stream;
}

final FTMSBloc ftmsBloc = FTMSBloc();
