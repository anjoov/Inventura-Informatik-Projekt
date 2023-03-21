// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:helloworld/components/itemTile.dart";
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

  @override
  void initState() {
    super.initState();
    Provider.of<InventarData>(context, listen: false).prepareData();
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
                            hintText: "Price (euro.cents)",
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
    Navigator.pop(context);
    clear();
    print(Provider.of<InventarData>(context, listen: false).allPriceItems());
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExpenseNameController.clear();
    newExpensePriceController.clear();
  }

  void deleteItem(InventarItem item) {
    Provider.of<InventarData>(context, listen: false).deleteItemFromList(item);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InventarData>(
        builder: (context, value, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Expanded(child: Row()),
                Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 0.915 * 0.915 * MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.getEveryItem().length,
                    itemBuilder: (context, index) => ItemTile(
                      name: value.getEveryItem()[index].name,
                      price: value.getEveryItem()[index].price,
                      category: value.getEveryItem()[index].category,
                      dateTime: value.getEveryItem()[index].date,
                      deleteTapped: (item) =>
                          deleteItem(value.getEveryItem()[index]),
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
