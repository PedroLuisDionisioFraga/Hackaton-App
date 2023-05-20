import 'package:flutter/material.dart';

class MyGradient {
  static LinearGradient getGradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Theme.of(context).colorScheme.primaryContainer,
        Theme.of(context).colorScheme.secondaryContainer,
      ],
    );
  }
}
