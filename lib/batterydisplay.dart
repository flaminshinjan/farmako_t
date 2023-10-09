import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryDisplay extends StatefulWidget {
  const BatteryDisplay({super.key});

  @override
  State<BatteryDisplay> createState() => _BatteryDisplayState();
}

class _BatteryDisplayState extends State<BatteryDisplay> {
  static const batteryChannel = MethodChannel('samples.flutter.dev/battery');
  String batteryLevel = 'Waiting...';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                batteryLevel,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: getBatteryLevel,
                child: const Text('Get Battery Level'),
              ),
            ],
          )),
    );
  }

  Future getBatteryLevel() async {
    final arguments = {'name': 'John Doe'};
    final int newBatteryLevel =
        await batteryChannel.invokeMethod('getBatteryLevel', arguments);
    setState(() => batteryLevel = '$newBatteryLevel % ');
  }
}
