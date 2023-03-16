import 'package:flutter/material.dart';
import 'package:helloworld/data/hive_database.dart';
import 'package:helloworld/models/inventar_item.dart';
import "package:helloworld/data/hive_database.dart";

class InventarData extends ChangeNotifier {
//Liste aller items

  List<InventarItem> itemListe = [];

//Liste callen
  List<InventarItem> getEveryItem() {
    return itemListe;
  }

  final db = HiveDataBase();
  void prepareData() {
    if (db.readData().isNotEmpty) {
      itemListe = db.readData();
    }
  }

//neues item adden
  void addNewItemToList(InventarItem newItem) {
    itemListe.add(newItem);
    notifyListeners();
    db.saveData(itemListe);
  }

//item deleten
  void deleteItemFromList(InventarItem item) {
    itemListe.remove(item);
    notifyListeners();
    db.saveData(itemListe);
  }

  void sortName() {
    itemListe
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  void printLen() {}
}
