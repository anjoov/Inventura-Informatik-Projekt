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
  String dropDownValue = "Other";

  void dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropDownValue = selectedValue;
      });
    }
  }

// Items adden
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
                            controller: newExpenseNameController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Name")),

                        //Item price
                        TextField(
                          controller: newExpensePriceController,
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
                      onChanged: (String? value){
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
        category: dropDownValue,
        date: DateTime.now());

    Provider.of<InventarData>(context, listen: false).addNewItemToList(newItem);
    Provider.of<InventarData>(context, listen: false).printLen();

    Navigator.pop(context);
    print(dropDownValue);
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
                Expanded(
                    child: Row(
                  children: [],
                )),
                Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 0.915 * 0.915 * MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: value.getEveryItem().length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(value.getEveryItem()[index].name),
                      subtitle: Text(convertDateTimeToString(
                              value.getEveryItem()[index].date) +"                                                                              "+
                          value.getEveryItem()[index].category +
                          "  "),
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
