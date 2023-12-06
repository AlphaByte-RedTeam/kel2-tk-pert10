import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<SalesData> data = [
      SalesData(0, 1500000),
      SalesData(1, 1735000),
      // Add more data here
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Line Chart Example'),
        ),
        body: Center(
          child: Container(
            height: 300,
            child: charts.LineChart(
              _getSeriesData(data),
              animate: true,
            ),
          ),
        ),
      ),
    );
  }

  List<charts.Series<SalesData, int>> _getSeriesData(List<SalesData> data) {
    return [
      charts.Series(
        id: "Sales",
        data: data,
        domainFn: (SalesData series, _) => series.year,
        measureFn: (SalesData series, _) => series.sales,
        colorFn: (SalesData series, _) =>
            charts.MaterialPalette.blue.shadeDefault,
      ),
    ];
  }
}

class SalesData {
  final int year;
  final int sales;
  SalesData(this.year, this.sales);
}
