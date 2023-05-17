import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Home/homepage.dart';
import 'complete_list.dart';
import 'main_screen.dart';
import 'pie_chart.dart';
import 'speedometer.dart';

//para arrumar a lista de apps, só vai ser preciso passar esses apps para essa lista
//lista de apps
final List<String> apps = ['Netflix', 'Amazon', 'Google'];

Widget createContainersApp() {
  return Column(
    children: apps.map((texto) {
      return Container(
        width: 200,
        height: 50,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            texto,
            style: const TextStyle(
              color: Color.fromARGB(255, 85, 85, 85),
              fontSize: 18,
            ),
          ),
        ),
      );
    }).toList(),
  );
}

//lista de conexoes
final List<String> connections = ['Celular de Gustavo', 'Computador de Rosemeire', 'Coleira Bluetooth da Nina'];

Widget createContainersConnection() {
  return Column(
    children: connections.map((connect) {
      return Container(
        width: 200,
        height: 50,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            connect,
            style: const TextStyle(
              color: Color.fromARGB(255, 85, 85, 85),
              fontSize: 15,
            ),
          ),
        ),
      );
    }).toList(),
  );
}

//tela principal
class MonitoringPage extends StatefulWidget {
  const MonitoringPage({super.key});

  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color.fromRGBO(0, 114, 223, 100), Color.fromRGBO(0, 223, 197, 100)],
          ),
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //linha de botões superior
              MainButtonsMainScreen(),
              //ícone principal e tudo mais
              CenterMonitoring(),
              //parte preta da página
              BottomPage()
            ],
          ),
        ),
      ),
    );
  }
}

//tela que vai passando
class CenterMonitoring extends StatefulWidget {
  const CenterMonitoring({super.key});

  @override
  _CenterMonitoringState createState() => _CenterMonitoringState();
}

class _CenterMonitoringState extends State<CenterMonitoring> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.92,
      width: MediaQuery.of(context).size.width * 0.8,
      color: const Color.fromARGB(0, 255, 193, 7),
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Aplicativos em uso',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(milliseconds: 500)),
              ),
              SizedBox(
                height: 300,
                width: 400,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Padding(
                      //necessário fazer um for para todos os apps
                      padding: const EdgeInsets.all(8.0),
                      child: createContainersApp(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Protocolos utilizados',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(milliseconds: 500)),
              ),
              Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                height: 400,
                width: 500,
                child: const SizedBox(height: 300, width: 300, child: ChartPie()),
              )
            ],
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Alertas',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(milliseconds: 500)),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color.fromARGB(255, 255, 255, 255)),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Você não possui nenhum alerta!',
                          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 82, 82, 82), fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(height: 200, width: 200, child: Image.asset('assets/check.png')),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Tudo certo por aqui.',
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  'Velocidade',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(milliseconds: 500)),
              ),
              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: 550,
                      height: 220,
                      child: const Align(
                          child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: SpeedometerUpload(),
                            ),
                          ),
                          SizedBox(
                              height: 100,
                              width: 200,
                              child: Center(
                                  child: Text(
                                'Velocidade de upload',
                                style: TextStyle(fontSize: 15),
                              )))
                        ],
                      )))),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: 550,
                      height: 220,
                      child: const Align(
                          child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: SpeedometerDownload(),
                            ),
                          ),
                          SizedBox(
                              height: 100,
                              width: 200,
                              child: Center(
                                  child: Text(
                                'Velocidade de download',
                                style: TextStyle(fontSize: 15),
                              )))
                        ],
                      ))))
            ],
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Conexões',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(milliseconds: 500)),
              ),
              SizedBox(
                height: 300,
                width: 800,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Padding(
                      //necessário fazer um for para todos os apps
                      padding: const EdgeInsets.all(8.0),
                      child: createContainersConnection(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Relatório Geral',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(milliseconds: 500)),
              ),
              Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: Colors.grey),
                height: 400,
                width: 300,
                child: const ContainerList(),
              )
            ],
          ),
        ),
      ),
    ),
  ];

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: _pages[_currentIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            int newIndex = _currentIndex + 1;
            if (newIndex >= _pages.length) {
              newIndex = 0;
            }
            _changePage(newIndex);
          },
          child: const Icon(
            Icons.navigate_next_outlined,
            color: Colors.blue,
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: Colors.grey),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _changePage,
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Colors.grey,
                icon: Icon(Icons.app_shortcut),
                label: 'Aplicativos em uso',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist_rounded),
                label: 'Protocolos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sd_card_alert_rounded),
                label: 'Alertas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.speed),
                label: 'Velocidade',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.connect_without_contact),
                label: 'Conexões',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.computer_outlined),
                label: 'Relatório Geral',
              ),
            ],
          ),
        ));
  }
}
