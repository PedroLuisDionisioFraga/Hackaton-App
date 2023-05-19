import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../monitoring_page.dart';

class MyCloudWarning extends StatelessWidget {
  final BoxConstraints constrains;

  const MyCloudWarning({
    super.key,
    required this.constrains,
  });

  @override
  Widget build(BuildContext context) {
    final double mediumSize = (constrains.maxHeight + constrains.maxWidth) / 2;

    return Tooltip(
      message: 'Avisos',
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const MonitoringPage(index: 2);
              },
            ),
          );
        },
        child: Container(
          height: constrains.maxHeight * 0.16,
          width: constrains.maxWidth * 0.16,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Assets/Images/cloud.png'),
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(
              bottom: mediumSize * 0.01,
              left: mediumSize * 0.035,
              right: mediumSize * 0.04,
              top: mediumSize * 0.03,
            ),
            child: Image.asset('Assets/Images/warning.png'),
          ),
        ).animate(onPlay: (controller) => controller.repeat()).scaleXY(duration: 1500.ms, begin: 1.0, end: 1.1).then(delay: const Duration(milliseconds: 100)).scaleXY(duration: 1500.ms, begin: 1.1, end: 1.0),
      ),
    );
  }
}
