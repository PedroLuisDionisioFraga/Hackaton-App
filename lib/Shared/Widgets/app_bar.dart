import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../Utils/screen_size.dart';

class MainButtons extends StatelessWidget {
  // Para dizer ao meu menu qual botão foi pressionado
  // para ir pra uma sessão especifica.
  final ValueChanged<String> onMenuClick;

  const MainButtons({
    super.key,
    required this.onMenuClick,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = ScreenSize.getHeight(context);
    final double screenWidth = ScreenSize.getWidth(context);

    return Container(
      height: screenHeight * 0.08,
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('Assets/Images/viasaticon.jpeg'),
          ).animate().slide(
                begin: const Offset(0, -10),
                duration: const Duration(seconds: 1),
              ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '&',
              style: Theme.of(context).textTheme.titleLarge,
            ).animate().slide(
                  begin: const Offset(0, -10),
                  duration: const Duration(seconds: 1),
                ),
          ),
          SizedBox(
            height: screenHeight * 0.08,
            width: screenWidth * 0.05,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('Assets/Images/icon.png'),
            ),
          ).animate().slide(
                begin: const Offset(0, -10),
                duration: const Duration(seconds: 1),
              ),
          const Expanded(
            child: Spacer(),
          ),
          //! Botões
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: SizedBox(
              height: screenHeight * 0.05,
              width: screenWidth * 0.1,
              child: OutlinedButton(
                onPressed: () {
                  onMenuClick("OurProductsSession");
                },
                child: const Text(
                  'Nossos Produtos',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: SizedBox(
              height: screenHeight * 0.05,
              width: screenWidth * 0.1,
              child: OutlinedButton(
                onPressed: () {
                  onMenuClick("Mais informações");
                },
                child: const Text(
                  'Mais informações',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: SizedBox(
              height: screenHeight * 0.05,
              width: screenWidth * 0.15,
              child: const TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Color.fromRGBO(0, 114, 223, 100),
                  hintText: 'Pesquise sobre algo....',
                  hintStyle: TextStyle(fontSize: 13),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(width: 3, color: Color.fromRGBO(0, 114, 223, 100)),
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Spacer(),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.translate),
            iconSize: 25,
            color: const Color.fromRGBO(0, 114, 223, 100),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: SizedBox(
                height: screenHeight * 0.05,
                width: screenWidth * 0.1,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/LoginPage');
                  },
                  child: const Expanded(
                    child: Text(
                      'Fazer login',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: SizedBox(
                height: screenHeight * 0.05,
                width: screenWidth * 0.1,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/SignUpPage');
                  },
                  child: const Expanded(
                    child: Text(
                      'Realizar cadastro',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    ).animate().slide(
          begin: const Offset(0, -10),
          duration: const Duration(seconds: 1),
        );
  }
}
