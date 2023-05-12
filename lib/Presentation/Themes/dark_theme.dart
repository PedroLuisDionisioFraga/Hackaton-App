import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,

    colorScheme: const ColorScheme.dark().copyWith(
      background: const Color.fromARGB(255, 12, 0, 82),

      // Gradient
      primaryContainer: const Color.fromARGB(255, 12, 0, 82),
      secondaryContainer: const Color.fromARGB(255, 18, 0, 119),
      tertiaryContainer: const Color.fromARGB(255, 18, 0, 157),
    ),

    textTheme: const TextTheme(),

    //splashColor: Colors.white,

    iconTheme: const IconThemeData(),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),

    elevatedButtonTheme: const ElevatedButtonThemeData(),

    cardTheme: const CardTheme(
    )
  );
}
