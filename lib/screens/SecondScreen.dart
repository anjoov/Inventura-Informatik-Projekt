// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import "package:flutter/material.dart";
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:helloworld/data/inventar_data.dart';
import 'package:helloworld/models/inventar_item.dart';
import 'package:provider/provider.dart';
import "package:helloworld/widget/pie_chart_sections.dart";
import "../data/globals.dart";
import "package:syncfusion_flutter_charts/charts.dart";

List<InventarItem> priceList = InventarData().getEveryItem();

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SecondScreenState();
}

class SecondScreenState extends State {
  late List<ChartInventarData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InventarData>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
            backgroundColor: Globals.backgroundColor,
            body: SfCircularChart(
                title: ChartTitle(
                    text: "Ausgaben nach Kategorie in Euro",
                    textStyle: TextStyle(color: Globals.textColor)),
                legend: Legend(
                    isVisible: true,
                    overflowMode: LegendItemOverflowMode.wrap,
                    title: LegendTitle(
                      textStyle: TextStyle(color: Globals.textColor),
                    )),
                series: <CircularSeries>[
                  PieSeries<ChartInventarData, String>(
                      dataSource: _chartData,
                      xValueMapper: (ChartInventarData data, _) => data.name,
                      yValueMapper: (ChartInventarData data, _) => data.money,
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ])),
      ),
    );
  }

  List<ChartInventarData> getChartData() {
    final List<ChartInventarData> chartData = [
      ChartInventarData(20, "Entertainment"),
      ChartInventarData(20, "Groceries"),
      ChartInventarData(300, "Other "),
      ChartInventarData(900, "Rent"),
      ChartInventarData(234, "Insurance"),
    ];
    return chartData;
  }
}

class ChartInventarData {
  ChartInventarData(this.money, this.name);
  final String name;
  final double money;
}
