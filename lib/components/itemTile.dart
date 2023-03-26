// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import "../data/globals.dart";

class ItemTile extends StatelessWidget {
  final String name;
  final String price;
  final String category;
  final DateTime dateTime;
  final void Function(BuildContext)? deleteTapped;

  const ItemTile({
    super.key,
    required this.name,
    required this.price,
    required this.category,
    required this.dateTime,
    required this.deleteTapped,
  });

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

    String normalDate = "$day/$month/$year";
    return normalDate;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: deleteTapped,
          icon: Icons.delete,
          backgroundColor: Color.fromARGB(255, 175, 42, 33),
        )
      ]),
      child: ListTile(
        textColor: Globals.textColor,
        title: Text(name),
        subtitle: Text(convertDateTimeToString(dateTime) +
            "                                                                        " +
            category),
        trailing: Text("€$price"),
      ),
    );
  }
}
