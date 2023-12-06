import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MaterialApp(
      home: SalesBarChart(),
    ));

class SalesBarChart extends StatelessWidget {
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final List<double> salesData = [
    1500000,
    1735000,
    1678000,
    1890000,
    1907000,
    2300000,
    2360000,
    1980000,
    2654000,
    2789070,
    3020000,
    3245900,
  ];

  SalesBarChart({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Data Bar Chart'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 400,
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Grafik Penjualan Selama 12 Bulan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 4000000,
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 80,
                              getTitlesWidget: (value, meta) {
                                var val = value.toInt();
                                const style = TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                );
                                return Text(
                                  val.toString(),
                                  style: style,
                                ); // Menampilkan nilai sebagai teks
                              },
                            ),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              getTitlesWidget: (value, meta) {
                                int monthIdx = value.toInt() + 1;
                                // sama aja pake cara ini
                                // (monthIdx >= 1 && monthIdx <= months.length)
                                //     ? Text(months[monthIdx - 1])
                                //     : Text('');
                                if (monthIdx >= 1 &&
                                    monthIdx <= months.length) {
                                  return Text(months[monthIdx - 1]);
                                }
                                return const Text('');
                              },
                              showTitles: true,
                              interval: 45,
                              reservedSize: 10,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: salesData
                            .asMap()
                            .entries
                            .map(
                              (entry) => BarChartGroupData(
                                x: entry.key,
                                barRods: [
                                  BarChartRodData(
                                    toY: entry.value,
                                    width: 15,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
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
}
