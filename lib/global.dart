
import 'package:abd_shop/models/amazing_model.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final List<AmazingModel> items = [];

  void addProduct(AmazingModel amazingModel) {
    items.add(amazingModel);
  }
  void removeItem(AmazingModel amazingModel) {
    items.remove(amazingModel);
    notifyListeners();
  }
  void clear() {
    items.clear();
    notifyListeners();
  }



}


