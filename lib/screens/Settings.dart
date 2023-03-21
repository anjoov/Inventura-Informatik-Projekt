// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import "../data/globals.dart";

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(
                child: Container(
                    child: FlutterSwitch(
                        width: 125.0,
                        height: 55.0,
                        valueFontSize: 25.0,
                        toggleSize: 45.0,
                        value: Globals.nightmode,
                        borderRadius: 30.0,
                        padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            Globals.nightmode = val;
                          });
                        })))));
  }
}
