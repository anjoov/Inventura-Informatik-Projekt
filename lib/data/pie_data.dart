import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:helloworld/components/itemTile.dart";
import "package:provider/provider.dart";

import "../models/inventar_item.dart";
import "../data/inventar_data.dart";

// ignore: non_constant_identifier_names


class pieData {
  final InventarData convertable;
  pieData(this.convertable);
  
  static List<Data> data= [
  Data(name: "Entertainment", percent: (InventarData().lenOthers("Entertainment"))/(InventarData().allPriceItems()), color:Color.fromARGB(255, 72, 126, 170) ),
  Data(name: "Groceries", percent: (InventarData().lenOthers("Groceries"))/(InventarData().allPriceItems()), color:Color.fromARGB(255, 48, 179, 54) ),
  Data(name: "Rent", percent: (InventarData().lenOthers("Rent"))/(InventarData().allPriceItems()), color:Color.fromARGB(255, 146, 72, 29) ),
  Data(name: "Insurance", percent: (InventarData().lenOthers("Insurance"))/(InventarData().allPriceItems()), color:Color.fromARGB(255, 89, 19, 168) ),
  Data(name: "Other", percent: (InventarData().lenOthers("Other"))/(InventarData().allPriceItems()), color:Color.fromARGB(255, 153, 180, 54) ),


  ];
}

class Data {
  final String name;
  final double percent;
  final Color color;
  Data({
    required this.name,
    required this.percent,
    required this.color,
  });
}
