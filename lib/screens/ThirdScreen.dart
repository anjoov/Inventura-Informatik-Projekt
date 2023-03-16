// ignore_for_file: prefer_const_constructors
/*
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:helloworld/globalvariables/global.dart';
import "../data/inventar_data.dart";
import "../models/inventar_item.dart";
import "package:provider/provider.dart";

// bar code scanner

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  String? scanResult;

  @override
  Widget build(BuildContext context) {
    return Consumer<InventarData>(
        builder: (context, value, child) => Scaffold(
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
                    scanResult == null
                        ? "Scan a code!"
                        : "Scan result: $scanResult",
                    style: TextStyle(fontSize: 18),
                  ),
                ]))));
  }

  Future scanBarcode() async {
    String scanResult;

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
      String name;
      String price;
      String dropDown;
      int i = itemsWithBarcodes.indexOf(scanResult);
      name = itemsWithBarcodes.elementAt(i + 1);
      price = itemsWithBarcodes.elementAt(i + 2);
      dropDown = itemsWithBarcodes.elementAt(i + 3);
      InventarItem newItem = InventarItem(
          name: name, price: price, category: dropDown, date: DateTime.now());

      Provider.of<InventarData>(context, listen: false)
          .addNewItemToList(newItem);
      Navigator.pop(context);
      clear();
    } else {
      itemsWithBarcodes.add(scanResult);
      addNewItem();
    }
  }

  final barcodeItemName = TextEditingController();
  final barcodeItemPrice = TextEditingController();
  String dropDownValue = "Other";

  void save() {
    itemsWithBarcodes.add(barcodeItemName.text);
    itemsWithBarcodes.add(barcodeItemPrice.text);
    itemsWithBarcodes.add(dropDownValue);

    InventarItem newItem = InventarItem(
        name: barcodeItemName.text,
        price: barcodeItemPrice.text,
        category: dropDownValue,
        date: DateTime.now());

    Provider.of<InventarData>(context, listen: false).addNewItemToList(newItem);
    Navigator.pop(context);
    clear();
  }

  void addNewItem() {
    showDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) =>
                AlertDialog(
                  title: Text("Add new Item"),
                  content: Row(children: [
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        //Item Name
                        TextField(
                            controller: barcodeItemName,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Name")),

                        //Item price
                        TextField(
                          controller: barcodeItemPrice,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Price",
                          ),
                        ),
                      ],
                    )),
                    DropdownButton(
                      items: const [
                        DropdownMenuItem(
                          value: "Entertainment",
                          child: Text("Entertainment"),
                        ),
                        DropdownMenuItem(
                          value: "Rent",
                          child: Text("Rent"),
                        ),
                        DropdownMenuItem(
                          value: "Insurance",
                          child: Text("Insurance"),
                        ),
                        DropdownMenuItem(
                          value: "Groceries",
                          child: Text("Groceries"),
                        ),
                        DropdownMenuItem(
                          value: "Other",
                          child: Text("Other"),
                        ),
                      ],
                      value: dropDownValue,
                      onChanged: (String? value) {
                        setState(() => dropDownValue = value!);
                      },
                    )
                  ]),
                  // ignore: prefer_const_literals_to_create_immutables
                  actions: [
                    //save button
                    //cancel button
                    MaterialButton(
                      onPressed: cancel,
                      child: Text("cancel"),
                    ),
                    MaterialButton(
                      onPressed: save,
                      child: Text("Save"),
                    )
                  ],
                )));
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    barcodeItemName.clear();
    barcodeItemPrice.clear();
  }
}
*/
