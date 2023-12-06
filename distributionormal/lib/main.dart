import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<FlSpot> dataPoints = generateNormalDistribution(100, 50, 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kurva Normal'),
        ),
        body: Center(
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(
                show: true,
                drawVerticalLine: true,
                drawHorizontalLine: true,
              ),
              titlesData: const FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: const Color(0xff37434d), width: 1),
              ),
              minX: 0,
              maxX: 100,
              minY: 0,
              maxY: 0.08,
              lineBarsData: [
                LineChartBarData(
                  spots: dataPoints,
                  isCurved: true,
                  color: Colors.blue,
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<FlSpot> generateNormalDistribution(
      int count, double mean, double stdDev) {
    final random = Random();
    final dataPoints = <FlSpot>[];
    for (int i = 0; i < count; i++) {
      final x = i.toDouble();
      final y = (1 / (stdDev * sqrt(2 * pi))) *
          exp(-pow(x - mean, 2) / (2 * pow(stdDev, 2)));
      dataPoints.add(FlSpot(x, y));
    }
    return dataPoints;
  }
}
