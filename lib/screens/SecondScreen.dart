import 'package:fl_chart/fl_chart.dart';
import "package:flutter/material.dart";
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:helloworld/data/inventar_data.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget{
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InventarData>(
      builder: (context, value, child)  => Scaffold(
        body: Column(
          children: <Widget>[


          ]
        )



      ),
      );
    
  }


}

