import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 150,
            width: 150,
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
      body: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Align(
          alignment: Alignment.topRight,
          child: SfRadialGauge(
            enableLoadingAnimation: true,
            animationDuration: 2200,
            axes: <RadialAxis>[
              RadialAxis(
                  startAngle: 270,
                  endAngle: 270,
                  minimum: 0,
                  maximum: 80,
                  interval: 10,
                  radiusFactor: 0.4,
                  showAxisLine: false,
                  showLastLabel: false,
                  minorTicksPerInterval: 4,
                  majorTickStyle: MajorTickStyle(
                      length: 8, thickness: 3, color: Colors.black),
                  minorTickStyle: MinorTickStyle(
                      length: 3, thickness: 1.5, color: Colors.black),
                  axisLabelStyle: GaugeTextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  onLabelCreated: labelCreated),
              RadialAxis(
                  pointers: <GaugePointer>[
                    NeedlePointer(
                        needleLength: 0.95,
                        enableAnimation: true,
                        animationType: AnimationType.ease,
                        needleStartWidth: 1.5,
                        needleEndWidth: 6,
                        needleColor: Colors.red,
                        knobStyle: KnobStyle(knobRadius: 0.09))
                  ],
                  ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0,
                        endValue: 200,
                        sizeUnit: GaugeSizeUnit.factor,
                        startWidth: 0.03,
                        endWidth: 0.03,
                        gradient: SweepGradient(colors: const <Color>[
                          Colors.green,
                          Colors.yellow,
                          Colors.red
                        ], stops: const <double>[
                          0.0,
                          0.5,
                          1
                        ]))
                  ],
                  minimum: 0,
                  maximum: 200,
                  labelOffset: 30,
                  axisLineStyle: AxisLineStyle(
                      thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
                  majorTickStyle: MajorTickStyle(
                      length: 6, thickness: 4, color: Colors.black),
                  minorTickStyle: MinorTickStyle(
                      length: 3, thickness: 3, color: Colors.black38),
                  axisLabelStyle: GaugeTextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 14))
            ],
          ),
        ),
        SizedBox(
          width: 250, height: 250, //height and width of guage
          child: SfRadialGauge(
              title: GaugeTitle(text: "Fuel Level"), //title for guage
              enableLoadingAnimation:
                  true, //show meter pointer movement while loading
              animationDuration: 4500, //pointer movement speed
              axes: <RadialAxis>[
                //Radial Guage Axix, use other Guage type here
                RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
                  //Guage Ranges
                  GaugeRange(
                      startValue: 0,
                      endValue: 50, //start and end point of range
                      color: Colors.green,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 50,
                      endValue: 100,
                      color: Colors.orange,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 100,
                      endValue: 150,
                      color: Colors.red,
                      startWidth: 10,
                      endWidth: 10)
                  //add more Guage Range here
                ], pointers: <GaugePointer>[
                  NeedlePointer(
                    value: 120,
                  ) //add needlePointer here
                  //set value of pointer to 80, it will point to '80' in guage
                ], annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Container(
                          child: Text('80.0',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))),
                      angle: 90,
                      positionFactor: 0.5),
                  //add more annotations 'texts inside guage' here
                ])
              ]),
        )
      ]),
    );
  }
}
