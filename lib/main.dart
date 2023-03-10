// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";
import 'package:helloworld/screens/SecondScreen.dart';
import 'screens/HomePage.dart';
import 'screens/ThirdScreen.dart';
import 'screens/Settings.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

int screenIndx = 1;
var screenArr = [HomePage(), SecondScreen(), ThirdScreen(), Settings()];

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
              height: 0.915 * MediaQuery.of(context).size.height,
              child: screenArr[screenIndx]),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 0.085 * MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.topCenter,
                child: GNav(
                  onTabChange: (index) {
                    screenIndx = index;
                    setState(() {});
                  },
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Settings',
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
