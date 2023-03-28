// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import "../data/globals.dart";
import 'package:toggle_switch/toggle_switch.dart';

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
                    color: Globals.backgroundColor,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlutterSwitch(
                            width: 80.0,
                            height: 50.0,
                            toggleSize: 45.0,
                            value: Globals.nightmode,
                            borderRadius: 30.0,
                            padding: 2.0,
                            activeToggleColor: Color(0xFF6E40C9),
                            inactiveToggleColor: Color(0xFF2F363D),
                            activeSwitchBorder: Border.all(
                              color: Color(0xFF3C1E70),
                              width: 4.0,
                            ),
                            inactiveSwitchBorder: Border.all(
                              color: Color(0xFFD1D5DA),
                              width: 4.0,
                            ),
                            activeColor: Color(0xFF271052),
                            inactiveColor: Colors.white,
                            activeIcon: Icon(
                              Icons.nightlight_round,
                              color: Color(0xFFF8E3A1),
                            ),
                            inactiveIcon: Icon(
                              Icons.wb_sunny,
                              color: Color(0xFFFFDF5D),
                            ),
                            onToggle: (val) {
                              setState(() {
                                Globals.nightmode = val;

                                if (val) {
                                  Globals.textColor = Colors.white;
                                  Globals.backgroundColor =
                                      Colors.grey.shade900;
                                  Globals.themeColor = Colors.blueAccent;
                                } else {
                                  Globals.textColor = Colors.black;
                                  Globals.backgroundColor = Colors.white;
                                  Globals.themeColor = Colors.blue;
                                }
                              });
                            },
                          ),
                          ToggleSwitch(
                            minWidth: 90.0,
                            cornerRadius: 20.0,
                            activeBgColors: [
                              [Colors.green[800]!],
                              [Colors.red[800]!]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            labels: ['True', 'False'],
                            radiusStyle: true,
                            onToggle: (index) {
                              print('switched to: $index');
                            },
                          ),
                        ])))));
  }
}
