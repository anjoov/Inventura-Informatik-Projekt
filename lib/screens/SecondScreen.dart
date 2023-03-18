// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import "package:flutter/material.dart";
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:helloworld/data/inventar_data.dart';
import 'package:provider/provider.dart';
import "package:helloworld/widget/pie_chart_sections.dart";

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SecondScreenState();
}

class SecondScreenState extends State {
  @override
  Widget build(BuildContext context) => Card(
    child: Column(
      children: 
        <Widget>[
          PieChart(
            PieChartData(
              sections: getSections(),
            ),
          ),
        ]
      )
  );
}
