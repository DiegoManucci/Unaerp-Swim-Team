import 'package:flutter/material.dart';

import 'home_trainer_state.dart';

class HomeTrainerController extends ChangeNotifier {
  final HomeTrainerState state = HomeTrainerState();

  void onItemTapped(int index) {
    state.selectedIndex = index;
    notifyListeners();
  }
}