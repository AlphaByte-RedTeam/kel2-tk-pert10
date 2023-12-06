import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';

class SalesData {
  String month;
  int totalSales;

  SalesData(this.month, this.totalSales);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Sales Histogram",
      home: SalesHistogram(),
    );
  }
}

class SalesHistogram extends StatefulWidget {
  const SalesHistogram({Key? key}) : super(key: key);

  @override
  State<SalesHistogram> createState() => _SalesHistogramState();
}

class _SalesHistogramState extends State<SalesHistogram> {
  late Future<List<SalesData>> salesDataFuture = Future.value([]);

  @override
  void initState() {
    super.initState();
    salesDataFuture = loadSalesData();
  }

  Future<List<SalesData>> loadSalesData() async {
    final rawData = await rootBundle.loadString("data/datapenjualan.csv");
    final List<List<dynamic>> data = const CsvToListConverter(
      fieldDelimiter: ",",
      eol: "\n",
    ).convert(rawData);

    // Check if there are at least two rows (header + data)
    if (data.length < 2) {
      throw Exception("Invalid CSV format: Insufficient rows");
    }

    // Skip the header row
    data.removeAt(0);

    List<SalesData> salesData = data.map((element) {
      return SalesData(element[0], int.parse(element[1].toString()));
    }).toList();

    return salesData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sales Histogram")),
      body: FutureBuilder<List<SalesData>>(
        future: salesDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            List<SalesData> salesData = snapshot.data!;
            return AspectRatio(
              aspectRatio: 1.66,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(builder: (context, constraints) {
                  final barSpace =
                      4.0 * constraints.maxWidth / salesData.length;
                  final barWidth =
                      0.7 * constraints.maxWidth / salesData.length;
                  return BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      barTouchData: BarTouchData(enabled: true),
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: true)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 16,
                            getTitlesWidget: (value, metaTitles) {
                              return Text(salesData[value.toInt()].month);
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: true),
                      barGroups: salesData
                          .asMap()
                          .map(
                            (index, data) => MapEntry(
                              index,
                              BarChartGroupData(
                                x: index,
                                barsSpace: barSpace,
                                barRods: [
                                  BarChartRodData(
                                    toY: data.totalSales.toDouble(),
                                    color: Colors.blue,
                                    width: barWidth,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .values
                          .toList(),
                    ),
                  );
                }),
              ),
            );
          }
        },
      ),
    );
  }
}
