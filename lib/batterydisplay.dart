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
      backgroundColor: Colors.white,
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/horse.jpg'),
                height: 600,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 183, 125, 58),
                  onPrimary: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: getBatteryLevel,
                child: const Text('Get Battery Level', style: ,),
              ),
              const SizedBox(height: 15.0),
              Text(
                batteryLevel,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
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
