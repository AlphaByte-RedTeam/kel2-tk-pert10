import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MaterialApp(
      home: PieChartExample(),
    ));

class PieChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> labels = [
      'Dokter',
      'Guru',
      'Pegawai Kantor',
      'Pedagang',
      'IT',
    ];
    List<double> jumlah = [20, 10, 12, 11, 25];
    double totalJumlah = jumlah.reduce((value, element) => value + element);
    return Scaffold(
      appBar: AppBar(
        title: Text('Grafik Pie Daftar Profesi'),
        centerTitle: true,
      ),
      body: Center(
        child: PieChart(
          PieChartData(
            sectionsSpace: 0,
            centerSpaceRadius: 80,
            sections: List<PieChartSectionData>.generate(
              labels.length,
              (int index) {
                double persentase = (jumlah[index] / totalJumlah) * 100;
                return PieChartSectionData(
                  title: '${labels[index]}\n${persentase.toStringAsFixed(2)}%',
                  value: jumlah[index],
                  color: getColor(index),
                  radius: 80,
                  showTitle: true,
                  titleStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  titlePositionPercentageOffset: 0.5,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(int index) {
    List<Color> colors = [
      Colors.yellow[600]!,
      Colors.orange,
      Colors.blue[200]!,
      Colors.green[400]!,
      Colors.yellow[800]!,
    ];
    return colors[index];
  }
}
