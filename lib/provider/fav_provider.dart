import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _favlist = [];
  List<int> get favlist => _favlist;

  void addvalue(int i) {
    favlist.add(i);
    notifyListeners();
  }

  void removevalue(int i) {
    favlist.remove(i);
    notifyListeners();
  }
}
