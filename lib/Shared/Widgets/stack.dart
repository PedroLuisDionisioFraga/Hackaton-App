import 'package:flutter/material.dart';

import '../../Presentation/Pages/Home/Clouds/cloud_annotation.dart';
import '../../Presentation/Pages/Home/Clouds/cloud_check_list.dart';
import '../../Presentation/Pages/Home/Clouds/cloud_warning.dart';
import '../../Presentation/Pages/Home/Clouds/cloud_apps.dart';
import '../../Presentation/Pages/Home/Clouds/cloud_report.dart';
import '../../Presentation/Pages/Home/Clouds/cloud_speedometer.dart';
import '../../Presentation/Pages/Home/image_center.dart';

class MyStackTest extends StatelessWidget {
  const MyStackTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green.withOpacity(0.6),
            Colors.green.withOpacity(0.25),
            Colors.green.withOpacity(0.0),
          ],
        ),
      ),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: LayoutBuilder(
            builder: (ctx, constrains) {
              return Stack(
                children: [
                  Center(child: MyCenterWidget(constrains: constrains)),
                  Positioned(
                    top: constrains.maxHeight * 0.06,
                    left: constrains.maxWidth * 0.2,
                    child: MyCloudNotes(constrains: constrains),
                  ),
                  Positioned(
                    top: constrains.maxHeight * 0.06,
                    left: constrains.maxWidth * 0.65,
                    child: MyCloudWarning(constrains: constrains),
                  ),
                  Positioned(
                    top: constrains.maxHeight * 0.35,
                    left: 10,
                    child: MyCloudSpeedometer(constrains: constrains),
                  ),
                  Positioned(
                    top: constrains.maxHeight * 0.35,
                    left: constrains.maxWidth * 0.805,
                    right: 10,
                    child: MyCloudReport(constrains: constrains),
                  ),
                  Positioned(
                    top: constrains.maxHeight * 0.7,
                    left: constrains.maxWidth * 0.175,
                    child: MyCloudCheckList(constrains: constrains),
                  ),
                  Positioned(
                    top: constrains.maxHeight * 0.7,
                    right: constrains.maxWidth * 0.15,
                    child: MyCloudApps(constrains: constrains),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
