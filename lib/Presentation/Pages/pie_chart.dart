import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ChartPie extends StatelessWidget {
  const ChartPie({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, double> dataMap = {
      "HTTPS": 5,
      "SMTP": 3,
      "TCP/IP": 2,
    };

    final colorList = [
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.redAccent,
      Colors.yellowAccent,
    ];

    return Scaffold(
      body: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 5,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
      ),
    );
  }
}
