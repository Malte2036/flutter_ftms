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
                  .where((element) => element.device.name.isNotEmpty)
                  .toList(),
              context),
        ),
      ],
    );
  }
}

class FTMSPage extends StatefulWidget {
  final BluetoothDevice ftmsDevice;

  const FTMSPage({Key? key, required this.ftmsDevice}) : super(key: key);

  @override
  State<FTMSPage> createState() => _FTMSPageState();
}

class _FTMSPageState extends State<FTMSPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ftmsDevice.name),
      ),
      body: StreamBuilder<DeviceData?>(
        stream: ftmsBloc.ftmsDeviceDataControllerStream,
        builder: (c, snapshot) {
          if (!snapshot.hasData) {
            return Column(
              children: [
                const Center(child: Text("No FTMSData found!")),
                ElevatedButton(
                  onPressed: () async => {
                    await FTMS.useDeviceDataCharacteristic(widget.ftmsDevice,
                        (data) {
                      ftmsBloc.ftmsDeviceDataControllerSink.add(data);
                    })
                  },
                  child: const Text("use FTMS"),
                ),
              ],
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  FTMS.convertDeviceDataTypeToString(
                      snapshot.data!.deviceDataType),
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: snapshot.data!
                      .getDeviceDataParameterValues()
                      .map((parameterValue) => Text(
                            parameterValue.toString(),
                            style: const TextStyle(fontSize: 16),
                          ))
                      .toList(),
                ),
                const Divider(
                  thickness: 2,
                ),
                Column(
                  children: snapshot.data!
                      .getDeviceDataFeatures()
                      .entries
                      .toList()
                      .map((entry) => Text('${entry.key.name}: ${entry.value}'))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
