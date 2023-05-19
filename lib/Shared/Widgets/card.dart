import 'package:flutter/material.dart';

class MyCardStyle extends StatelessWidget {
  final Widget childCard;

  const MyCardStyle({
    super.key,
    required this.childCard,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //clipBehavior: Clip.hardEdge,
      elevation: 2.6,
      margin: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 5,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      color: Color.fromARGB(255, 194, 235, 252),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 0,
        ),
        child: childCard,
      ),
    );
  }
}
