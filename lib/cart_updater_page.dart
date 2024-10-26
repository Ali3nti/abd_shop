import 'package:abd_shop/models/amazing_model.dart';
import 'package:flutter/material.dart';

class CartUpdater extends ChangeNotifier {
  int counterValue;
  CartUpdater({
    this.counterValue = 0,
  });
  void incrementNumber() {
    counterValue++;
    notifyListeners(); 
  }

  void decrementNumber() {
    counterValue--;
    notifyListeners();
  }

  void removeNumber(String value) {
    counterValue = value as int;
    notifyListeners();
  }
}
