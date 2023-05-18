import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/Shared/Utils/gradient.dart';
import '../../../Errors/not_found_session_exception.dart';
import '../../../Shared/Widgets/app_bar.dart';
import 'Sessions/more_info.dart';
import 'Sessions/our_products_session.dart';

/*
  Caso eu queira deixar meu menu fixo eu envolvo o "SingleChildScrollView"
  numa "Column" e coloco o menu como primeiro filho e o
  "SingleChildScrollView" como segundo filho e depois envolver
  "SingleChildScrollView" em um "Expanded" pq o "Column" n consegue
  restringir tamanho pra ele terminar pq n passa as constrains de
  tamanho pros filhos, porém o "Expanded" consegue passar,
  expandindo até o final da minha coluna e pegando seu tamanho.
  Agora temos que pegar onde o usuário está e depois fazer o rolamento.
  pegaremos a posição do usuário e somamos no "offSet.dy"
  fazendo assim "offSet.dy + scrollController.offset"
*/

//classe principal
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Criando um controlador de sessão pra ir na sessão que quero
  final ScrollController scrollController = ScrollController();

  // Usaremos "GlobalKey"'s pra recuperar as dimensões das sessões
  final GlobalKey session1 = GlobalKey();
  final GlobalKey session2 = GlobalKey();
  final GlobalKey session3 = GlobalKey();
  final GlobalKey session4 = GlobalKey();
  //final GlobalKey session5 = GlobalKey();

  void onMenuClick(String value) {
    // "RenderBox" tem todas infos de onde o componente foi feito na minha tela
    final RenderBox renderBox;

    switch (value) {
      case "OurProductsSession":
        renderBox = session1.currentContext!.findRenderObject() as RenderBox;
        break;
      case "Mais informações":
        renderBox = session2.currentContext!.findRenderObject() as RenderBox;
        break;
      default:
        throw NotFoundSessionException("Sessão não encontrada");
    }
    // Pegando a posição da sessão, "Offset.zero" pega o topo da aplicação
    final Offset offSet = renderBox.localToGlobal(const Offset(0, -40));
    // Indo pra sessão desejada
    scrollController.animateTo(
      offSet.dy,
      duration: const Duration(microseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    session1.currentState!.dispose();
    session2.currentState!.dispose();
    session3.currentState!.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          decoration: BoxDecoration(
            gradient: MyGradient.getGradient(context),
          ),
          child: Column(
            // Dividindo a página em sessões
            children: <Widget>[
              //linha de botões superior
              MainButtons(onMenuClick: onMenuClick),
              const IncluiStack(),
              //ícone principal e tudo mais
              OurProductsSession(key: session1),
              MoreInformationSession(key: session2),
              //parte preta da página
              BottomPage(key: session3),
            ],
          ),
        ),
      ),
    );
  }
}

class IncluiStack extends StatefulWidget {
  const IncluiStack({super.key});

  @override
  State<IncluiStack> createState() => _IncluiStackState();
}

class _IncluiStackState extends State<IncluiStack> {
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
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
              ],
            ),
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
        ),
      ],
    );
  }
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
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'Política e termos',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'Fale conosco',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
