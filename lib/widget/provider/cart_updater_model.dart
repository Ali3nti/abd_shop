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
    if (counterValue > 0) {
      counterValue--;
      notifyListeners();
    }
  }

  void setCounter(int value) {
    counterValue = value;
    notifyListeners();
  }


}
