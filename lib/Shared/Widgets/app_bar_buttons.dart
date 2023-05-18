import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MainButtonsMainScreen extends StatelessWidget {
  const MainButtonsMainScreen({super.key});

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
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.translate),
            iconSize: 25,
            color: const Color.fromRGBO(0, 114, 223, 100),
          ),
        ],
      ),
    ).animate().slide(
              begin: const Offset(0, -10),
              duration: const Duration(seconds: 1),
            ));
  }
}