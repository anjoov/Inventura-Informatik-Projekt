// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

// bar code scanner

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  String? scanResult;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Scan Barcode"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: Colors.black,
              ),
              icon: Icon(Icons.camera_alt_outlined),
              label: Text("start scan"),
              onPressed: scanBarcode,
            ),
            SizedBox(height: 20),
            Text(
              scanResult == null ? "Scan a code!" : "Scan result: $scanResult",
              style: TextStyle(fontSize: 18),
            ),
          ])));

  Future scanBarcode() async {
    String scanResult;

    List itemsWithBarcodes = [];

    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanResult = "Failed to get platform version.";
    }
    if (!mounted) return;

    setState(() => this.scanResult = scanResult);

    if (itemsWithBarcodes.contains(scanResult)) {
      //add item to HomePage
    } else {
      itemsWithBarcodes.add(scanResult);
      addNewItem();
    }
  }

  final barcodeItemName = TextEditingController();
  final barcodeItemPrice = TextEditingController();

  void save() {
    itemsWithBarcodes.add(barcodeItemName);

    Navigator.pop(context);
    clear();
  }

  void addNewItem() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add new Item"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  //Item Name
                  TextField(
                    controller: barcodeItemName,
                  ),

                  //Item price
                  TextField(
                    controller: barcodeItemPrice,
                  ),
                ],
              ),
              // ignore: prefer_const_literals_to_create_immutables
              actions: [
                //save button
                MaterialButton(
                  onPressed: save,
                  child: Text("Save"),
                ),

                //cancel button
                MaterialButton(
                  onPressed: cancel,
                  child: Text("cancel"),
                )
              ],
            ));
  }

//  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExpenseNameController.clear();
    newExpensePriceController.clear();
  }
}


appBar: AppBar(
            title: Text("Barcode Scanner/Generator")
            centerTitle: true,
          ),

Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BarcodeWidget(data: data, barcode: barcode)
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: buildTextField(context)
                    ),
                  ],
                ),
            ),
          )

Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BarcodeWidget(data: data, barcode: barcode)
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: buildTextField(context)
                    ),
                  ],
                ),
            ),
          )
*/