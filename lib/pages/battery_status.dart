import 'package:flutter/material.dart';

class BatteryStatus extends StatefulWidget {
  const BatteryStatus({Key? key}) : super(key: key);

  @override
  _BatteryStatusState createState() => _BatteryStatusState();
}

class _BatteryStatusState extends State<BatteryStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("This is Battery status"),
      ),
    );
  }
}
