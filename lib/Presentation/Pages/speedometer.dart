import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

var random = Random();
double randomNumber = random.nextDouble() * 200;

class SpeedometerUpload extends StatefulWidget {
  const SpeedometerUpload({Key? key}) : super(key: key);

  @override
  State<SpeedometerUpload> createState() => _SpeedometerUploadState();
}

class _SpeedometerUploadState extends State<SpeedometerUpload> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        randomNumber = random.nextDouble() * 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 200,
                ranges: <GaugeRange>[
                  GaugeRange(startValue: 0, endValue: 50, color: Colors.blue),
                  GaugeRange(startValue: 50, endValue: 100, color: Colors.green),
                  GaugeRange(startValue: 100, endValue: 150, color: Colors.orange),
                  GaugeRange(startValue: 150, endValue: 200, color: Colors.red),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(value: randomNumber),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Container(
                      child: Text(
                        randomNumber.toStringAsFixed(2) + 'kB/s',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    angle: randomNumber,
                    positionFactor: 0.5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpeedometerDownload extends StatefulWidget {
  const SpeedometerDownload({Key? key}) : super(key: key);

  @override
  State<SpeedometerDownload> createState() => _SpeedometerDownloadState();
}

class _SpeedometerDownloadState extends State<SpeedometerDownload> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        randomNumber = random.nextDouble() * 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 200,
                ranges: <GaugeRange>[
                  GaugeRange(startValue: 0, endValue: 50, color: Colors.blue),
                  GaugeRange(startValue: 50, endValue: 100, color: Colors.green),
                  GaugeRange(startValue: 100, endValue: 150, color: Colors.orange),
                  GaugeRange(startValue: 150, endValue: 200, color: Colors.red),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(value: randomNumber),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Container(
                      child: Text(
                        randomNumber.toStringAsFixed(2) + 'kB/s',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    angle: randomNumber,
                    positionFactor: 0.5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

