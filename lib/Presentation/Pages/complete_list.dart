import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

var random = Random();

//lista de nomes
List nomes = ['chrome.exe', 'Teams_windows_x64', 'Discord.exe'];
int randomint = random.nextInt(3);

int numProc = random.nextInt(3);

//tamanho do pacote
int numPac = random.nextInt(1000);

//upload e download
double randomNumber = random.nextDouble() * 10;
double randomNumber1 = random.nextDouble() * 10;

//metodos
List metodos = ['POST', 'GET', 'OPTIONS'];

class ContainerList extends StatefulWidget {
  const ContainerList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContainerListState createState() => _ContainerListState();
}

class _ContainerListState extends State<ContainerList> {
  List<bool> itemExpanded = List.generate(5, (index) => false);

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
        numProc = random.nextInt(5);
        randomint = random.nextInt(3);
        randomNumber = random.nextDouble() * 10;
        randomNumber1 = random.nextDouble() * 10;
        numPac = random.nextInt(1000);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: numProc, // Número de itens na lista
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Card(
            color: Color.fromARGB(255, 226, 255, 241),
            child: ExpansionTile(
              title: const Text('Requisição'),
              onExpansionChanged: (expanded) {
                setState(() {
                  itemExpanded[index] = expanded;
                });
              },
              initiallyExpanded: itemExpanded[index],
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        //upload, download e protocolo
                        Text('Nome:  ${nomes[randomint]}'),
                        Text('Upload:  ${randomNumber.toStringAsFixed(2)}KB'),
                        Text('Download:  ${randomNumber1.toStringAsFixed(2)}KB'),
                        const Text('Tipo de conteúdo: application/json'),
                        Text('Métodos utilizados: $metodos'),
                        Text('Tamanho do pacote: $numPac'),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
