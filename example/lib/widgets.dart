// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_ftms/flutter_ftms.dart';
import 'package:flutter_ftms_example/bloc.dart';
import 'package:flutter_ftms_example/main.dart';

Widget scanBluetoothButton(bool? isScanning) {
  print('isScanning changed: $isScanning');
  if (isScanning == null) {
    return Container();
  }

  return ElevatedButton(
    onPressed:
        isScanning ? null : () async => await FTMS.scanForBluetoothDevices(),
    child: isScanning
        ? const Text("Scanning...")
        : const Text("Scan FTMS Devices"),
  );
}

Widget scanResultsToWidget(List<ScanResult> data, BuildContext context) {
  return Column(
    children: data
        .map(
          (d) => ListTile(
            title: FutureBuilder<bool>(
                future: FTMS.isBluetoothDeviceFTMSDevice(d.device),
                initialData: false,
                builder: (c, snapshot) {
                  return Text(
                    d.device.name.isEmpty ? "(unknown device)" : d.device.name,
                  );
                }),
            subtitle: Text(d.device.id.id),
            leading: SizedBox(
              width: 40,
              child: Center(
                child: Text(d.rssi.toString()),
              ),
            ),
            trailing: getButtonForBluetoothDevice(d.device, context),
          ),
        )
        .toList(),
  );
}

Widget getButtonForBluetoothDevice(
    BluetoothDevice device, BuildContext context) {
  return StreamBuilder<BluetoothDeviceState>(
      stream: device.state,
      builder: (c, snapshot) {
        if (!snapshot.hasData) {
          return const Text("...");
        }
        var deviceState = snapshot.data!;
        switch (deviceState) {
          case BluetoothDeviceState.disconnected:
            return ElevatedButton(
              child: const Text("Connect"),
              onPressed: () async {
                await FTMS.connectToFTMSDevice(device);
                device.state.listen((state) async {
                  if (state == BluetoothDeviceState.disconnected ||
                      state == BluetoothDeviceState.disconnecting) {
                    ftmsBloc.ftmsDeviceDataControllerSink.add(null);
                    return;
                  }
                });
              },
            );
          case BluetoothDeviceState.connected:
            return SizedBox(
              child: Wrap(
                spacing: 2,
                alignment: WrapAlignment.end,
                direction: Axis.horizontal,
                children: [
                  FutureBuilder<bool>(
                    future: FTMS.isBluetoothDeviceFTMSDevice(device),
                    initialData: false,
                    builder: (c, snapshot) => (snapshot.data ?? false)
                        ? ElevatedButton(
                            child: const Text("FTMS"),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FTMSPage(
                                        ftmsDevice: device,
                                      )),
                            ),
                          )
                        : Container(),
                  ),
                  OutlinedButton(
                    child: const Text("Disconnect"),
                    onPressed: () => FTMS.disconnectFromFTMSDevice(device),
                  )
                ],
              ),
            );
          default:
            return Text(deviceState.name);
        }
      });
}
