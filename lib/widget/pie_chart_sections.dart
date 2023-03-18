import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/data/pie_data.dart';

List<PieChartSectionData> getSections() => pieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        title: "${data.percent}",
        // ignore: prefer_const_constructors
  


      );

      return MapEntry(index, value);
    })
    .values
    .toList();
