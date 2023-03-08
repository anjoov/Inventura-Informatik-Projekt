// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:google_nav_bar/google_nav_bar.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: Container(
          color: Colors.purple,
        )


      )
    );
  }
}

