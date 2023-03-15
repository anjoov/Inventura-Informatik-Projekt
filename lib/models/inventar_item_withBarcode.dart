import 'dart:ffi';

class InventarItem {
  final String name;
  final String price;
  final DateTime date;
  final String barcode;

  InventarItem(
      {required this.name,
      required this.price,
      required this.date,
      required this.barcode});
}
