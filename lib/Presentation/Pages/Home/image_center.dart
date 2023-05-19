import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyCenterWidget extends StatefulWidget {
  final BoxConstraints constrains;

  const MyCenterWidget({
    super.key,
    required this.constrains,
  });

  @override
  State<MyCenterWidget> createState() => _MyCenterWidgetState();
}

class _MyCenterWidgetState extends State<MyCenterWidget> {
  @override
  Widget build(BuildContext context) {
    final double mediumSize = (widget.constrains.maxHeight + widget.constrains.maxWidth) / 2;
    return Container(
      padding: EdgeInsets.all(mediumSize * 0.20),
      constraints: BoxConstraints(
        maxHeight: widget.constrains.maxHeight * 0.7,
        maxWidth: widget.constrains.maxWidth * 0.7,
      ),
      decoration: DottedDecoration(
        shape: Shape.circle,
        color: Colors.white,
        strokeWidth: mediumSize * 0.018,
        dash: const <int>[12, 10],
      ),
      child: Image.asset(
        'Assets/Images/icon.png',
      ).animate(onPlay: (controller) => controller.repeat()).rotate(duration: 60000.milliseconds, begin: -1, end: 1).animate().scaleXY(duration: 500.ms, begin: 0.0, end: 1.1),
    ).animate().scaleXY(duration: 500.ms, begin: 0.0, end: 1.1).then(delay: const Duration(milliseconds: 1000)).animate(onPlay: (controller) => controller.repeat()).rotate(
          duration: 60000.milliseconds,
          begin: 1,
          end: -1,
        );
  }
}
