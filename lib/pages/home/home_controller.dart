import 'package:flutter/material.dart';

import 'home_state.dart';

class HomeController extends ChangeNotifier {
  final HomeState state = HomeState();

  void onItemTapped(int index) {
    state.selectedIndex = index;
    notifyListeners();
  }
}