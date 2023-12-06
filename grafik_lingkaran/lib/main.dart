import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pie Chart Example'),
        ),
        body: Center(
          child: Container(
            height: 300,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 30,
                    title: 'A',
                    color: Colors.blue,
                  ),
                  PieChartSectionData(
                    value: 20,
                    title: 'B',
                    color: Colors.green,
                  ),
                  PieChartSectionData(
                    value: 10,
                    title: 'C',
                    color: Colors.yellow,
                  ),
                  PieChartSectionData(
                    value: 15,
                    title: 'B',
                    color: Colors.red,
                  ),
// Add more data here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
