import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MaterialApp(
    home: BarChartExample(),
  ));
}

class BarChartExample extends StatelessWidget {
  const BarChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart Example'),
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
                    "Grafik Batang",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 10,
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 10,
                              getTitlesWidget: (value, meta) {
                                var val = value.toInt();
                                const style =
                                    TextStyle(color: Colors.blue, fontSize: 14);
                                if (val == 0) {
                                  return const Text('A', style: style);
                                } else if (val == 1) {
                                  return const Text('B', style: style);
                                } else if (val == 2) {
                                  return const Text('C', style: style);
                                } else if (val == 3) {
                                  return const Text('D', style: style);
                                } else if (val == 4) {
                                  return const Text('E', style: style);
                                } else {
                                  return const Text('', style: style);
                                }
                                // switch (value.toInt()) {
                                //   case 0:
                                //     return const Text(
                                //       'A',
                                //       style: TextStyle(
                                //           color: Colors.blue, fontSize: 14),
                                //     );
                                //   case 1:
                                //     return const Text(
                                //       'B',
                                //       style: TextStyle(
                                //           color: Colors.yellow, fontSize: 14),
                                //     );
                                //   case 2:
                                //     return const Text(
                                //       'C',
                                //       style: TextStyle(
                                //           color: Colors.green, fontSize: 14),
                                //     );
                                //   case 3:
                                //     return const Text(
                                //       'D',
                                //       style: TextStyle(
                                //           color: Colors.red, fontSize: 14),
                                //     );
                                //   case 4:
                                //     return const Text(
                                //       'E',
                                //       style: TextStyle(
                                //           color: Colors.orange, fontSize: 14),
                                //     );
                                //   default:
                                //     return const Text(
                                //       '',
                                //       style: TextStyle(
                                //           color: Colors.orange, fontSize: 14),
                                //     );
                                // }
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                toY: 5,
                                width: 15,
                                color: Colors.blue,
                              ),
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                toY: 7,
                                width: 15,
                                color: Colors.yellow,
                              ),
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                toY: 3,
                                width: 15,
                                color: Colors.green,
                              ),
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                toY: 8,
                                width: 15,
                                color: Colors.red,
                              ),
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barRods: [
                              BarChartRodData(
                                toY: 4,
                                width: 15,
                                color: Colors.orange,
                              ),
                            ],
                            showingTooltipIndicators: [0],
                          ),
                        ],
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
