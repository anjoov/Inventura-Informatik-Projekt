// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";
import 'package:provider/provider.dart';
import 'data/inventar_data.dart';
import 'screens/SecondScreen.dart';
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

int screenIndx = 0;
var screenArr = [HomePage(), SecondScreen(), ThirdScreen(), Settings()];

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InventarData(),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: 0.915 * MediaQuery.of(context).size.height,
              child: screenArr[screenIndx],
            ),
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
      ),
    );
  }
}
