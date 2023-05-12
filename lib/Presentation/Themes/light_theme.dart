import 'package:flutter/material.dart';

class LightTheme {
  static const Color errorColor = Color.fromARGB(255, 231, 32, 32);
  static const Color textColor = Color.fromARGB(255, 0, 0, 0);

  static OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: const BorderRadius.all(Radius.circular(9)),
    );
  }

  static TextStyle _buildTextStyle(Color color) {
    return TextStyle(
      color: color,
    );
  }

  //! Esquema de cores
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color.fromARGB(255, 247, 247, 247),
      secondary: const Color.fromARGB(255, 228, 1, 1),

      background: const Color.fromARGB(255, 37, 175, 255),

      // Gradient
      primaryContainer: const Color.fromARGB(255, 37, 175, 255),
      secondaryContainer: const Color.fromARGB(255, 64, 166, 224),
      tertiaryContainer: const Color.fromARGB(228, 172, 223, 252),

      // Cor do erro
      error: errorColor,
    ),

    /*
    */

    //! Tema dos textos
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        color: textColor,
        fontSize: 12.5,
      ),
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(5),
      ),
    ),

    /*
    */

    //! Tema dos ícones
    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 111, 69, 179),
      size: 22,
    ),
    //! Tema dos botões de ícones
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
        iconColor: MaterialStatePropertyAll(Color.fromARGB(255, 0, 170, 255)),
      ),
    ),
    //! Tema principal dos ícones
    primaryIconTheme: const IconThemeData(
      color: Colors.blueGrey,
      size: 22,
    ),


    /*
    */

    //! Tema da AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),

    /*
    */

    //! Tema do botão elevado
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 9, 141, 202)),
        foregroundColor: MaterialStatePropertyAll(Colors.white),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),

    /*
    */

    //! Tema do Card
    cardTheme: const CardTheme(
      elevation: 10,
      shadowColor: Colors.black,
      color: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),

    /*selectionColor: define a cor de fundo do texto selecionado.
    selectionHandleColor: define a cor dos botões de seleção (alças) usados ​​para redimensionar a seleção. O que indica o tracinho que pisca
    cursorColor: define a cor do cursor intermitente usado para indicar onde o texto será inserido. O tracinho que pisca*/
    textSelectionTheme: const TextSelectionThemeData(
      // Muda a cor do "indicador" do tracinho que pisca quando escrevemos
      selectionHandleColor: Colors.blueGrey,
      cursorColor: Color.fromARGB(255, 130, 177, 255),
      selectionColor: Color.fromARGB(255, 119, 194, 255),
    ),

    /*
    */

    //! Tema do Form do TextFormField
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.only(
        left: 12,
        right: 12,
        bottom: 4,
        top: 10,
      ),
      labelStyle: _buildTextStyle(textColor),
      // Label ao clicar no textformfield
      floatingLabelStyle: _buildTextStyle(textColor),
      // Ao clicar no textformfield
      focusedBorder: _buildBorder(const Color.fromARGB(255, 134, 73, 16)),
      //
      disabledBorder: _buildBorder(Colors.amber),
      //
      prefixIconColor: const Color.fromARGB(255, 94, 101, 189),
      //
      errorBorder: _buildBorder(errorColor),
      focusedErrorBorder: _buildBorder(errorColor),
      errorStyle: _buildTextStyle(errorColor),
      //isDense: true,
      hintStyle: const TextStyle(
        fontSize: 13.5,
      ),
    ),

    /*
    */
  );
}
