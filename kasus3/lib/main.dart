import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: BarChartExample()));
}

class SalesData {
  final int year;
  final int jakartaSales;
  final int baliSales;
  final int jawaBaratSales;
  SalesData(this.year, this.jakartaSales, this.baliSales, this.jawaBaratSales);
}

final List<SalesData> data = [
  SalesData(0, 1100000, 1000000, 1150000),
  SalesData(1, 1550000, 1350000, 1200000),
  SalesData(2, 1300000, 1400000, 1480000),
  SalesData(3, 1250000, 1450000, 1500000),
  SalesData(4, 1190000, 1200000, 1300000),
  SalesData(5, 1450000, 1600000, 1200000),
  SalesData(7, 1090000, 1100000, 1600000),
  SalesData(8, 1170000, 1500000, 1500000),
  SalesData(9, 1790000, 1240000, 1700000),
  SalesData(10, 1190000, 1000000, 1200000),
  SalesData(11, 1210000, 1200000, 1800000),
  // Tambahkan data penjualan untuk tahun-tahun berikutnya
];

class BarChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Penjualan Di Tiga Provinsi'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Data Penjualan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: charts.LineChart(
                      _getSeriesData(data),
                      animate: true,
                      defaultRenderer:
                          charts.LineRendererConfig(includePoints: true),
                      behaviors: [
                        charts.SeriesLegend(
                          position: charts.BehaviorPosition.top,
                          horizontalFirst: false,
                          cellPadding: EdgeInsets.all(4.0),
                          showMeasures: true,
                          measureFormatter: (num? value) {
                            return value == null
                                ? '-'
                                : '${value.toStringAsFixed(2)}';
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<charts.Series<SalesData, int>> _getSeriesData(List<SalesData> data) {
    return [
      charts.Series(
        id: "Jakarta",
        data: data,
        domainFn: (SalesData series, _) => series.year,
        measureFn: (SalesData series, _) => series.jakartaSales,
        colorFn: (SalesData series, _) =>
            charts.MaterialPalette.blue.shadeDefault,
        displayName: 'Jakarta',
      ),
      charts.Series(
        id: "Bali",
        data: data,
        domainFn: (SalesData series, _) => series.year,
        measureFn: (SalesData series, _) => series.baliSales,
        colorFn: (SalesData series, _) =>
            charts.MaterialPalette.red.shadeDefault,
        displayName: 'Bali',
      ),
      charts.Series(
        id: "Jawa Barat",
        data: data,
        domainFn: (SalesData series, _) => series.year,
        measureFn: (SalesData series, _) => series.jawaBaratSales,
        colorFn: (SalesData series, _) =>
            charts.MaterialPalette.green.shadeDefault,
        displayName: 'Jawa Barat',
      ),
    ];
  }
}

