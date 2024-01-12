import 'package:flutter/cupertino.dart';

import 'articles.dart';

class CartProvider with ChangeNotifier {
  final List<Articles> _items = [];

  List<Articles> get items => _items;

  void add(Articles item) {
    // Find the index of the item in the list based on its id
    int index = _items.indexWhere((element) => element.id == item.id);

    if (index != -1) {
      // If the item is found in the list, increase its quantity
      _items[index].quantity++;
    } else {
      // If the item is not found, set its quantity to 1 and add it to the list
      item.quantity = 1;
      _items.add(item);
    }
    notifyListeners();
  }

  void remove(Articles item) {
    // Find the index of the item in the list based on its id
    int index = _items.indexWhere((element) => element.id == item.id);

    if (index != -1) {
      if (_items[index].quantity > 1) {
        // If the item's quantity is more than 1, decrease its quantity
        _items[index].quantity--;
      } else {
        // If the item's quantity is 1, remove the item from the list
        _items.removeAt(index);
      }
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  int getNumberItems() {
    int numberItems = 0;
    for (var item in _items) {
      numberItems += item.quantity;
    }
    return numberItems;
  }

  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in _items) {
      totalPrice += item.quantity * item.prix;
    }
    return totalPrice;
  }
}
