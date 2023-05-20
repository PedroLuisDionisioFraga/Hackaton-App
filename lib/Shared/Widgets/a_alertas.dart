import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Increment extends StatefulWidget {
  const Increment({super.key});

  @override
  _IncrementState createState() => _IncrementState();
}

class _IncrementState extends State<Increment> {
  int currentValue = 10;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        int randomIncrement = Random().nextInt(6);
        currentValue += randomIncrement;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('O consumo atual é $currentValue KB de 40MB', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),);
  }
}
