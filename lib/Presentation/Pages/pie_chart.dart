import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ChartPie extends StatelessWidget {
  const ChartPie({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {"tls": 1, "srtp": 1, "http": 2, "https": 2, "dns": 2, "smtp": 3, "imap": 1};

    final colorList = [
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.redAccent,
      Colors.yellowAccent,
      const Color.fromARGB(255, 240, 105, 206),
      Colors.blueAccent,
      Colors.redAccent,
    ];

    return Padding(
      padding: const EdgeInsets.all(42),
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 80,
        chartRadius: MediaQuery.of(context).size.width / 5,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        legendOptions: const LegendOptions(
          legendTextStyle: TextStyle(
            fontFamily: "Inter",
            fontSize: 18,
          ),
          legendShape: BoxShape.rectangle,
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValues: false,
          showChartValueBackground: false,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
      ),
    );
  }
}
