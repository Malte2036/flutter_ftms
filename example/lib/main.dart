import 'package:flutter/material.dart';
import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms_example/bloc.dart';
import 'package:flutter_ftms_example/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FTMS Example App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const FlutterFTMSApp(),
    );
  }
}

class FlutterFTMSApp extends StatefulWidget {
  const FlutterFTMSApp({super.key});

  @override
  State<FlutterFTMSApp> createState() => _FlutterFTMSAppState();
}

class _FlutterFTMSAppState extends State<FlutterFTMSApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter_ftms example"),
      ),
      body: const ScanPage(),
    );
  }
}

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: StreamBuilder<bool>(
            stream: FTMS.isScanning,
            builder: (c, snapshot) =>
                scanBluetoothButton(snapshot.data ?? false),
          ),
        ),
        StreamBuilder<List<ScanResult>>(
          stream: FTMS.scanResults,
          initialData: const [],
          builder: (c, snapshot) => scanResultsToWidget(
              (snapshot.data ?? [])
                  .where((element) => element.device.platformName.isNotEmpty)
                  .toList(),
              context),
        ),
      ],
    );
  }
}

class FTMSPage extends StatefulWidget {
  final BluetoothDevice ftmsDevice;

  const FTMSPage({super.key, required this.ftmsDevice});

  @override
  State<FTMSPage> createState() => _FTMSPageState();
}

class _FTMSPageState extends State<FTMSPage> {
  void writeCommand(MachineControlPointOpcodeType opcodeType) async {
    MachineControlPoint? controlPoint;
    switch (opcodeType) {
      case MachineControlPointOpcodeType.requestControl:
        controlPoint = MachineControlPoint.requestControl();
        break;
      case MachineControlPointOpcodeType.reset:
        controlPoint = MachineControlPoint.reset();
        break;
      case MachineControlPointOpcodeType.setTargetSpeed:
        controlPoint = MachineControlPoint.setTargetSpeed(speed: 12);
        break;
      case MachineControlPointOpcodeType.setTargetInclination:
        controlPoint =
            MachineControlPoint.setTargetInclination(inclination: 23);
        break;
      case MachineControlPointOpcodeType.setTargetResistanceLevel:
        controlPoint =
            MachineControlPoint.setTargetResistanceLevel(resistanceLevel: 3);
        break;
      case MachineControlPointOpcodeType.setTargetPower:
        controlPoint = MachineControlPoint.setTargetPower(power: 34);
        break;
      case MachineControlPointOpcodeType.setTargetHeartRate:
        controlPoint = MachineControlPoint.setTargetHeartRate(heartRate: 45);
        break;
      case MachineControlPointOpcodeType.startOrResume:
        controlPoint = MachineControlPoint.startOrResume();
        break;
      case MachineControlPointOpcodeType.stopOrPause:
        controlPoint = MachineControlPoint.stopOrPause(pause: true);
        break;
      default:
        throw 'MachineControlPointOpcodeType $opcodeType is not implemented in this example';
    }

    try {
      await FTMS.writeMachineControlPointCharacteristic(
          widget.ftmsDevice, controlPoint);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Command ${opcodeType.name} sent successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send command ${opcodeType.name}: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              '${widget.ftmsDevice.platformName} (${FTMS.getDeviceDataTypeWithoutConnecting(widget.ftmsDevice)})'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Data',
                icon: Icon(Icons.data_object),
              ),
              Tab(
                text: 'Device Data Features',
                icon: Icon(Icons.featured_play_list_outlined),
              ),
              Tab(
                text: 'Machine Features',
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SingleChildScrollView(
              child: StreamBuilder<DeviceData?>(
                stream: ftmsBloc.ftmsDeviceDataControllerStream,
                builder: (c, snapshot) {
                  if (!snapshot.hasData) {
                    return Column(
                      children: [
                        const Center(child: Text("No FTMSData found!")),
                        ElevatedButton(
                          onPressed: () async {
                            await FTMS.useDeviceDataCharacteristic(
                                widget.ftmsDevice, (DeviceData data) {
                              ftmsBloc.ftmsDeviceDataControllerSink.add(data);
                            });
                          },
                          child: const Text("use FTMS"),
                        ),
                      ],
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          FTMS.convertDeviceDataTypeToString(
                              snapshot.data!.deviceDataType),
                          textScaler: const TextScaler.linear(4),
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: snapshot.data!
                              .getDeviceDataParameterValues()
                              .map((parameterValue) => Text(
                                    parameterValue.toString(),
                                    textScaler: const TextScaler.linear(2),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SingleChildScrollView(
              child: StreamBuilder<DeviceData?>(
                stream: ftmsBloc.ftmsDeviceDataControllerStream,
                builder: (c, snapshot) {
                  if (!snapshot.hasData) {
                    return Column(
                      children: [
                        const Center(child: Text("No FTMSData found!")),
                        ElevatedButton(
                          onPressed: () async {
                            await FTMS.useDeviceDataCharacteristic(
                                widget.ftmsDevice, (DeviceData data) {
                              ftmsBloc.ftmsDeviceDataControllerSink.add(data);
                            });
                          },
                          child: const Text("use FTMS"),
                        ),
                      ],
                    );
                  }

                  return Column(
                    children: [
                      Text(
                        "Device Data Features",
                        textScaler: const TextScaler.linear(3),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      Column(
                        children: snapshot.data!
                            .getDeviceDataFeatures()
                            .entries
                            .toList()
                            .map((entry) =>
                                Text('${entry.key.name}: ${entry.value}'))
                            .toList(),
                      ),
                    ],
                  );
                },
              ),
            ),
            Column(
              children: [
                MachineFeatureWidget(ftmsDevice: widget.ftmsDevice),
                const Divider(
                  height: 2,
                ),
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: MachineControlPointOpcodeType.values
                        .map(
                          (MachineControlPointOpcodeType opcodeType) => Padding(
                            padding: const EdgeInsets.all(4),
                            child: OutlinedButton(
                              onPressed: () => writeCommand(opcodeType),
                              child: Text(opcodeType.name),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MachineFeatureWidget extends StatefulWidget {
  final BluetoothDevice ftmsDevice;

  const MachineFeatureWidget({super.key, required this.ftmsDevice});

  @override
  State<MachineFeatureWidget> createState() => _MachineFeatureWidgetState();
}

class _MachineFeatureWidgetState extends State<MachineFeatureWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ftmsBloc.ftmsMachineFeaturesControllerStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Column(
            children: [
              const Text("No Machine Features found!"),
              ElevatedButton(
                  onPressed: () async {
                    MachineFeature? machineFeature = await FTMS
                        .readMachineFeatureCharacteristic(widget.ftmsDevice);
                    ftmsBloc.ftmsMachineFeaturesControllerSink
                        .add(machineFeature);
                  },
                  child: const Text("get Machine Features")),
            ],
          );
        }
        return Column(
          children: snapshot.data!
              .getFeatureFlags()
              .entries
              .toList()
              .where((element) => element.value)
              .map((entry) => Text('${entry.key.name}: ${entry.value}'))
              .toList(),
        );
      },
    );
  }
}
