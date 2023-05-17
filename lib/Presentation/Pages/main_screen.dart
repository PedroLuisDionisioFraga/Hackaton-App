import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../Home/homepage.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 200),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Text(
                        'Escolha um modo de monitoramento para começar!',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const CloudsMain(),
              ],
            ),
            //parte preta da página
            const BottomPage()
          ],
        ),
      ),
    ));
  }
}

class ScreenCenterMain extends StatefulWidget {
  const ScreenCenterMain({super.key});

  @override
  State<ScreenCenterMain> createState() => _ScreenCenterMainState();
}

class _ScreenCenterMainState extends State<ScreenCenterMain> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.92,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Padding(
                        padding: const EdgeInsets.all(70.0),
                        child: Container(
                          decoration: DottedDecoration(shape: Shape.circle, color: Colors.white, strokeWidth: 5, dash: const <int>[12, 10]),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Padding(
                              padding: const EdgeInsets.all(60.0),
                              child: Image.asset('Assets/Images/icon.png').animate(onPlay: (controller) => controller.repeat()).rotate(duration: 60000.milliseconds, begin: -1, end: 1),
                            ),
                          ).animate().scaleXY(duration: 500.ms, begin: 0.0, end: 1.1),
                        ),
                      ),
                    ).animate().scaleXY(duration: 500.ms, begin: 0.0, end: 1.1).then(delay: const Duration(milliseconds: 1000)).animate(onPlay: (controller) => controller.repeat()).rotate(duration: 60000.milliseconds, begin: 1, end: -1),
                  ],
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class MainButtonsMainScreen extends StatefulWidget {
  const MainButtonsMainScreen({super.key});

  @override
  State<MainButtonsMainScreen> createState() => _MainButtonsMainScreenState();
}

class _MainButtonsMainScreenState extends State<MainButtonsMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.08,
      color: Colors.white,
      child: Row(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.08,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('Assets/Images/viasaticon.jpeg'),
                ),
              ).animate().slide(begin: const Offset(0, -10), duration: const Duration(seconds: 1))),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: const Text(
                  '&',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(seconds: 1)),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.05,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('Assets/Images/icon.png'),
                ),
              ).animate().slide(begin: const Offset(0, -10), duration: const Duration(seconds: 1))),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.1,
                child: OutlinedButton(
                    onPressed: () {
                      //const ProdutosDisponiveis();
                    },
                    child: const Text(
                      'Nossos Produtos',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.1,
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Mais informações',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.15,
              child: const TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Color.fromRGBO(0, 114, 223, 100),
                  hintText: 'Pesquise sobre algo...',
                  hintStyle: TextStyle(fontSize: 13),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 3, color: Color.fromRGBO(0, 114, 223, 100)),
                  ),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 550.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.translate),
              iconSize: 25,
              color: const Color.fromRGBO(0, 114, 223, 100),
            ),
          ),
        ],
      ),
    ).animate().slide(
              begin: const Offset(0, -10),
              duration: const Duration(seconds: 1),
            ));
  }
}

class CloudsMain extends StatefulWidget {
  const CloudsMain({super.key});

  @override
  State<CloudsMain> createState() => _CloudsMainState();
}

class _CloudsMainState extends State<CloudsMain> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const ScreenCenterMain(),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 10),
          child: SizedBox(
            height: 300,
            width: 700,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0, left: 10),
                      child: Tooltip(
                        message: 'Aplicativos em uso',
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/Connections');
                          },
                          child: Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('Assets/Images/cloud.png'), fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
                                child: Container(
                                    decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('Assets/Images/application.png'), fit: BoxFit.contain),
                                )),
                              )).animate(onPlay: (controller) => controller.repeat()).scaleXY(duration: 1500.ms, begin: 1.0, end: 1.1).then(delay: const Duration(milliseconds: 100)).scaleXY(duration: 1500.ms, begin: 1.1, end: 1.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150, bottom: 100),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Tooltip(
                          message: 'Protocolos',
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed('/ChartPie'),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('Assets/Images/cloud.png'), fit: BoxFit.cover),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 25),
                                child: Container(
                                    decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('Assets/Images/check-list.png'), fit: BoxFit.contain),
                                )),
                              ),
                            ).animate(onPlay: (controller) => controller.repeat()).scaleXY(duration: 1500.ms, begin: 1.0, end: 1.1).then(delay: const Duration(milliseconds: 100)).scaleXY(duration: 1500.ms, begin: 1.1, end: 1.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 160, top: 100),
                      child: Tooltip(
                        message: 'Alertas',
                        child: GestureDetector(
                          //onTap: () => Navigator.of(context).pushNamed('/homePage'),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('Assets/Images/cloud.png'), fit: BoxFit.cover),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
                              child: Container(
                                  decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('Assets/Images/warning.png'), fit: BoxFit.contain),
                              )),
                            ),
                          ).animate(onPlay: (controller) => controller.repeat()).scaleXY(duration: 1500.ms, begin: 1.0, end: 1.1).then(delay: const Duration(milliseconds: 100)).scaleXY(duration: 1500.ms, begin: 1.1, end: 1.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 500.0, left: 40),
          child: SizedBox(
            height: 300,
            width: 750,
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Tooltip(
                    message: 'Velocidade',
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed('/speedometer'),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('Assets/Images/cloud.png'), fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 15),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage('Assets/Images/speedometer.png'), fit: BoxFit.contain),
                            ),
                          ),
                        ),
                      ).animate(onPlay: (controller) => controller.repeat()).scaleXY(duration: 1500.ms, begin: 1.0, end: 1.1).then(delay: const Duration(milliseconds: 100)).scaleXY(duration: 1500.ms, begin: 1.1, end: 1.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150, top: 200),
                  child: Tooltip(
                    message: "Conexões",
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/ConnectionsApp');
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('Assets/Images/cloud.png'), fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                          child: Container(
                              decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage('Assets/Images/neural.png'), fit: BoxFit.contain),
                          )),
                        ),
                      ).animate(onPlay: (controller) => controller.repeat()).scaleXY(duration: 1500.ms, begin: 1.0, end: 1.1).then(delay: const Duration(milliseconds: 100)).scaleXY(duration: 1500.ms, begin: 1.1, end: 1.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 280),
                  child: Tooltip(
                    message: 'Relatório Completo',
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/monitoringPage');
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('Assets/Images/cloud.png'), fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 15),
                          child: Container(
                              decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage('Assets/Images/report.png'), fit: BoxFit.contain),
                          )),
                        ),
                      ).animate(onPlay: (controller) => controller.repeat()).scaleXY(duration: 1500.ms, begin: 1.0, end: 1.1).then(delay: const Duration(milliseconds: 100)).scaleXY(duration: 1500.ms, begin: 1.1, end: 1.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
