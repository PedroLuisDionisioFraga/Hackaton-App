import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'Shared/Widgets/app_bar.dart';

//classe principal
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                  const MainButtons(),
                  //ícone principal e tudo mais
                  incluiStack(),
                  //parte preta da página
                  const BottomPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget incluiStack() {
  return Stack(
    children: <Widget>[
      const ScreenCenter(),
      Padding(
        padding: const EdgeInsets.only(
          left: 140,
          top: 40,
          bottom: 10,
        ),
        child: SizedBox(
          height: 200,
          width: 600,
          child: Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, left: 10),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('Assets/Images/cloud.png'), fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage('Assets/Images/application.png'), fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ).animate(onPlay: (controller) => controller.repeat()).scaleXY(duration: 1500.ms, begin: 1.0, end: 1.1).then(delay: const Duration(milliseconds: 100)).scaleXY(duration: 1500.ms, begin: 1.1, end: 1.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Container(
                    height: 140,
                    width: 140,
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
                Padding(
                  padding: const EdgeInsets.only(left: 90, top: 100),
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
              ],
            ),
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 600.0, left: 100),
        child: SizedBox(
          height: 300,
          width: 640,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 70),
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('Assets/Images/cloud.png'), fit: BoxFit.cover),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 25, left: 20, right: 25, bottom: 15),
                      child: Container(
                          decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('Assets/Images/speedometer.png'), fit: BoxFit.contain),
                      ))),
                ).animate(onPlay: (controller) => controller.repeat()).scaleXY(duration: 1500.ms, begin: 1.0, end: 1.1).then(delay: const Duration(milliseconds: 100)).scaleXY(duration: 1500.ms, begin: 1.1, end: 1.0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 200, bottom: 30),
                child: Container(
                  height: 110,
                  width: 110,
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
              Padding(
                padding: const EdgeInsets.only(left: 90, top: 50),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('Assets/Images/cloud.png'), fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, left: 40, right: 25, bottom: 15),
                    child: Container(
                        decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('Assets/Images/report.png'), fit: BoxFit.contain),
                    )),
                  ),
                ).animate(onPlay: (controller) => controller.repeat()).scaleXY(duration: 1500.ms, begin: 1.0, end: 1.1).then(delay: const Duration(milliseconds: 100)).scaleXY(duration: 1500.ms, begin: 1.1, end: 1.0),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

class ScreenCenter extends StatefulWidget {
  const ScreenCenter({super.key});

  @override
  State<ScreenCenter> createState() => _ScreenCenterState();
}

class _ScreenCenterState extends State<ScreenCenter> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.92,
      child: Column(children: [
        Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 10.0),
                    child: Text('/Página Inicial', style: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(seconds: 1)),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 680.0),
                    child: Text('Seja bem-vindo(a) ao CyberFlow!', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ).animate().slide(begin: const Offset(0, -10), duration: const Duration(seconds: 1)),
              ],
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Padding(
                      padding: const EdgeInsets.all(80.0),
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
            Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const Center(
                      child: Text(
                        'As nuvenzinhas ao lado indicam quais são as opções de monitoriamento para você!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset('Assets/Images/chatbot.png').animate(onPlay: (controller) => controller.repeat()).shimmer(delay: 1000.ms, duration: 1800.ms),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}

class BottomPage extends StatelessWidget {
  const BottomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'Quem somos',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'Política e termos',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'Fale conosco',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
