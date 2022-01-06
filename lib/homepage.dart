import 'package:flutter/material.dart';
import 'package:mavericks_dashboard/pages/battery_status.dart';
import 'package:mavericks_dashboard/pages/speed_fuel_page.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  void start() {
    setState(() {
      value = 140;
    });
    Future.delayed(Duration(seconds: 2));
    setState(() {
      value = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  void labelCreated(AxisLabelCreatedArgs args) {
    if (args.text == '0') {
      args.text = 'N';
      args.labelStyle = GaugeTextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
    } else if (args.text == '10')
      args.text = '';
    else if (args.text == '20')
      args.text = 'E';
    else if (args.text == '30')
      args.text = '';
    else if (args.text == '40')
      args.text = 'S';
    else if (args.text == '50')
      args.text = '';
    else if (args.text == '60')
      args.text = 'W';
    else if (args.text == '70') args.text = '';
  }

  List pages = [SppedFuel(), BatteryStatus()];
  int index = 0;

  @override
  Widget build(BuildContext contextdata) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {
              index = 0;
              setState(() {});
            },
            child: Container(
                margin: EdgeInsets.all(10),
                height: size.height * 0.22,
                width: size.width * 0.16,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: 80,
                        width: 80,
                        child: Image.asset('assets/speedometer.png')),
                    Text(
                      'Speed & Fuel',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      'Level',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              index = 1;
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: size.height * 0.22,
              width: size.width * 0.16,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20, bottom: 5),
                      height: 80,
                      width: 80,
                      child: Image.asset('assets/battery.png')),
                  Text(
                    'Battery Status',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: size.height * 0.22,
            width: size.width * 0.16,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0)
                ]),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: size.height * 0.22,
            width: size.width * 0.16,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0)
                ]),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: size.height * 0.22,
            width: size.width * 0.16,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0)
                ]),
          )
        ],
      ),
      body:  pages[index],
    );
  }
}
