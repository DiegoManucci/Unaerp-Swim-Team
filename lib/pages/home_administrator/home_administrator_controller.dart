import 'package:flutter/material.dart';

import 'home_administrator_state.dart';

class HomeAdministratorController extends ChangeNotifier {
  final HomeAdministratorState state = HomeAdministratorState();

  void onItemTapped(int index) {
    state.selectedIndex = index;
    notifyListeners();
  }
}