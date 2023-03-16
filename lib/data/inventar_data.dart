import 'package:flutter/material.dart';
import 'package:helloworld/models/inventar_item.dart';

class InventarData extends ChangeNotifier {
//Liste aller items

  List<InventarItem> itemListe = [];

//Liste callen
  List<InventarItem> getEveryItem() {
    return itemListe;
  }

//neues item adden
  void addNewItemToList(InventarItem newItem) {
    itemListe.add(newItem);
    notifyListeners();
  }

//item deleten
  void deleteExpense(InventarItem item) {
    itemListe.remove(item);
  }

  void sortName() {
    itemListe
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  void printLen() {
    print(itemListe.length);
  }
}
