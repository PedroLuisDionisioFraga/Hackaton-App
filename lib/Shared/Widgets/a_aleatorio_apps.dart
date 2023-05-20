import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

var random = Random();
double randomNumber = random.nextDouble() * 10; // Gera um número aleatório entre 0 e 1
double randomNumber1 = random.nextDouble() * 10;

class ContainerApps extends StatefulWidget {
  const ContainerApps({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContainerAppsState createState() => _ContainerAppsState();
}

class _ContainerAppsState extends State<ContainerApps> {
  List<String> names = ['chrome.exe', 'Teams_windows_x64', 'Discord.exe'];

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
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        randomNumber = random.nextDouble() * 10;
        randomNumber1 = random.nextDouble() * 10;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3, // Número de itens na lista
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionTile(
            title: Text(names[index]),
            children: [
              Column(
                children: [
                  //upload, download e protocolo
                  Text('Upload: ${randomNumber.toStringAsFixed(2)}KB'),
                  Text('Download: ${randomNumber1.toStringAsFixed(2)}KB'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
