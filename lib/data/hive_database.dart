import 'package:hive/hive.dart';
import "../data/inventar_data.dart";
import "../models/inventar_item.dart";

class HiveDataBase {
  final _myBox = Hive.box("inventar_database");

  void saveData(List<InventarItem> allItem) {
    List<List<dynamic>> allItemsFormatted = [];

    for (var item in allItem) {
      List<dynamic> itemsFormatted = [
        item.name,
        item.price,
        item.date,
        item.category,
      ];
      allItemsFormatted.add(itemsFormatted);
    }

    _myBox.put("ALL_ITEMS", allItemsFormatted);
  }

  List<InventarItem> readData() {
    List savedItems = _myBox.get("ALL_ITEMS") ?? [];
    List<InventarItem> allItems = [];
    for (int i = 0; i < savedItems.length; i++) {
      String name = savedItems[i][0];
      String price = savedItems[i][1];
      DateTime date = savedItems[i][2];
      String category = savedItems[i][3];

      InventarItem item = InventarItem(
        name: name,
        price: price,
        date: date,
        category: category,
      );
      allItems.add(item);
    }
    return allItems;
  }
}
