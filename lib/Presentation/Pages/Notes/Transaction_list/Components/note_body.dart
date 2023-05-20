import 'package:flutter/material.dart';

class NoteBody extends StatelessWidget {
  final String body;
  //final Widget childContainer;

  const NoteBody({
    super.key,
    required this.body,
    //required this.childContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 90,
      // Decorando o "Container"
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(5),
      ),
      // Distância entre "margin" e "child"
      padding: const EdgeInsets.all(5),
      child: Text(
        body,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
