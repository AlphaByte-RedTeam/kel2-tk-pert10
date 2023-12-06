import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "CSV Viewer",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final String csvData =
        await rootBundle.loadString("data/datapenjualan.csv");
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvData);
    setState(() {
      data = csvTable;
    });
  }

  List<DataColumn> getColumns() {
    return data
        .map((e) => DataColumn(label: Expanded(child: Text(e.toString()))))
        .toList();
  }

  List<DataRow> getRows() {
    return data
        .sublist(1)
        .map((e) =>
            DataRow(cells: e.map((e) => DataCell(Text(e.toString()))).toList()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSV Viewer"),
      ),
      body: ListView.builder(
        itemCount: data.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          return Text(
            data[index].toString(),
            style: const TextStyle(fontSize: 24),
          );
        },
      ),
    );
  }
}
