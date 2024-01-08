import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  double _opacityy = 1.0;
  double get opacityy => _opacityy;

  void setopacity(double value) {
    _opacityy = value;
    notifyListeners();
  }
}
