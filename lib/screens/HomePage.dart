// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../data/inventar_data.dart";
import "../models/inventar_item.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// controller for textFields

  final newExpenseNameController = TextEditingController();

  final newExpensePriceController = TextEditingController();

// Items adden
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
                    controller: newExpenseNameController,
                  ),

                  //Item price
                  TextField(
                    controller: newExpensePriceController,
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

  String convertDateTimeToString(DateTime dateTime) {
    String year = dateTime.year.toString();
    String month = dateTime.month.toString();
    if (month.length == 1) {
      month = "0$month";
    }
    String day = dateTime.month.toString();
    if (day.length == 1) {
      day = "0$day";
    }

    String normalDate = "$year/$month/$day";
    return normalDate;
  }

  void save() {
    InventarItem newItem = InventarItem(
        name: newExpenseNameController.text,
        price: newExpensePriceController.text,
        date: DateTime.now());

    Provider.of<InventarData>(context, listen: false).addNewItem(newItem);

    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExpenseNameController.clear();
    newExpensePriceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InventarData>(
        builder: (context, value, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 0.915 * 0.915 * MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: value.getEveryItem().length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(value.getEveryItem()[index].name),
                      subtitle: Text(convertDateTimeToString(
                          value.getEveryItem()[index].date)),
                      trailing: Text("€" + value.getEveryItem()[index].price),
                    ),
                  ),
                ),
                Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    height: 0.085 * 0.915 * MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: FloatingActionButton(
                        onPressed: addNewItem, child: Icon(Icons.add))),
              ],
            )));
  }
}
