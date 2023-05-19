import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/Presentation/Pages/Notes/Transaction_list/Components/note_title.dart';
import 'package:intl/intl.dart';
import '../../Models/note.dart';
import '../../Shared/Widgets/a_aleatorio_apps.dart';
import '../../Shared/Widgets/a_alertas.dart';
import '../../Shared/Widgets/card.dart';
import 'Home/homepage.dart';
import 'Notes/Transaction_list/Components/note_body.dart';
import 'Notes/Transaction_list/Components/note_date.dart';
import 'Notes/Transaction_list/Components/note_delete.dart';
import 'Notes/modal_to_add_new_note.dart';
import 'complete_list.dart';
import 'main_screen.dart';
import 'pie_chart.dart';
import 'speedometer.dart';

class ConnectionsApp extends StatelessWidget {
  const ConnectionsApp({super.key});

  @override
  Widget build(BuildContext context) {
    //para arrumar a lista de apps, só vai ser preciso passar esses apps para essa lista
    //lista de apps
    final List<String> apps = ['Netflix', 'Amazon', 'Google'];
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
}

class ConnectionsContainer extends StatelessWidget {
  const ConnectionsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //lista de conexoes
    final List<String> connections = ['Celular de Gustavo', 'Computador de Rosemeire', 'Coleira Bluetooth da Nina'];
    return Scaffold(
      body: Column(
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
      ),
    );
  }
}

//tela principal
class MonitoringPage extends StatefulWidget {
  final int index;
  const MonitoringPage({
    super.key,
    required this.index,
  });

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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //linha de botões superior
              const MainButtonsMainScreen(),
              //ícone principal e tudo mais
              CenterMonitoring(index: widget.index),
              //parte preta da página
              const BottomPage()
            ],
          ),
        ),
      ),
    );
  }
}

//tela que vai passando
class CenterMonitoring extends StatefulWidget {
  final int index;
  const CenterMonitoring({
    super.key,
    required this.index,
  });

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
      child: MyHomePage(index: widget.index),
    );
  }
}

class PagesToMyHomePage extends StatefulWidget {
  const PagesToMyHomePage({super.key});

  @override
  State<PagesToMyHomePage> createState() => _PagesToMyHomePageState();
}

class _PagesToMyHomePageState extends State<PagesToMyHomePage> {
  _openTransactionForm(BuildContext context) {
    // Builder é o layout do modal
    showModalBottomSheet(
      //duration: Duration(milliseconds: 600),
      isScrollControlled: true,
      context: context,
      builder: (context) => ShowBarModalBottom(addTransaction: _addNote),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
    );
  }

  _addNote(String title, String body, DateTime date) {
    final newNote = Note(
      title: title,
      body: body,
      date: date,
      id: notes.length,
    );

    setState(() {
      notes.add(newNote);
    });
    // Fechando o teclado
    Navigator.of(context).pop();
  }

  final List<Note> notes = [
    Note(
      title: "Água",
      body: "81.4",
      date: DateTime.now().subtract(const Duration(days: 4)),
      id: 0,
    ),
    Note(
      title: "Água",
      body: "81.4",
      date: DateTime.now().subtract(const Duration(days: 4)),
      id: 1,
    ),
    Note(
      title: "Água",
      body: "81.4",
      date: DateTime.now().subtract(const Duration(days: 4)),
      id: 2,
    ),
    Note(
      title: "Água",
      body: "81.4",
      date: DateTime.now().subtract(const Duration(days: 4)),
      id: 3,
    ),
    Note(
      title: "Água",
      body: "81.4",
      date: DateTime.now().subtract(const Duration(days: 4)),
      id: 4,
    ),
    Note(
      title: "Água",
      body: "81.4",
      date: DateTime.now().subtract(const Duration(days: 4)),
      id: 5,
    ),
    Note(
      title: "Água",
      body: "81.4",
      date: DateTime.now().subtract(const Duration(days: 4)),
      id: 6,
    ),
  ];
  _removeNote(int id) {
    setState(() {
      notes.removeWhere((transaction) => transaction.idNote == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //! Substituir com o modal
        // TODO: Substituir com o modal
        Expanded(
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
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: 700,
                    child: Padding(
                      //necessário fazer um for para todos os apps
                      padding: const EdgeInsets.all(8.0),
                      child: notes.isEmpty
                          ? const SizedBox()
                          : ListView.builder(
                              itemCount: notes.length,
                              itemBuilder: (context, index) {
                                final note = notes[index];
                                final String dateFormat = DateFormat("EEEE d MMMM y", "pt_Br").format(note.date);
                                return MyCardStyle(
                                  childCard: ListTile(
                                    leading: NoteDate(dateFormat: dateFormat),
                                    title: NoteTitle(title: note.title),
                                    subtitle: NoteBody(body: note.body),
                                    trailing: NoteDelete(removeNote: _removeNote, idNote: note.idNote),
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () => _openTransactionForm(context),
                      splashColor: Theme.of(context).splashColor,
                      child: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  int index;
  MyHomePage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              Container(
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: const Padding(
                  //necessário fazer um for para todos os apps
                  padding: EdgeInsets.all(8.0),
                  child: ContainerApps(),
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
          color: Colors.transparent,
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  'Protocolos utilizados no dia de hoje',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(milliseconds: 500)),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.transparent,
                ),
                height: 400,
                width: 500,
                child: const SizedBox(
                  height: 300,
                  width: 300,
                  child: ChartPie(),
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
                  'Alertas',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(milliseconds: 500)),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 400,
                  width: 350,
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Color.fromARGB(255, 255, 255, 255)),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Increment(),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Você não possui nenhum alerta!',
                          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 82, 82, 82), fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(height: 200, width: 200, child: Image.asset('Assets/Images/check.png')),
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
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  'Velocidade média dos Uploads e Downloads de hoje',
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    //! Substituir com o modal
    // TODO: Substituir com o modal
    const PagesToMyHomePage(),
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                ),
                height: 400,
                width: 300,
                padding: const EdgeInsets.all(8),
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
      widget.index = index;
    });
  }

  int aux = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _pages[widget.index],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          int newIndex = widget.index + 1;
          if (newIndex >= _pages.length) {
            newIndex = 0;
            aux = 0;
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
          currentIndex: widget.index,
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
      ),
    );
  }
}
