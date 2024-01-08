import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var _thememood = ThemeMode.light;
  ThemeMode get thememood => _thememood;

  void settheme(thememood) {
    _thememood = thememood;
    notifyListeners();
  }
}
