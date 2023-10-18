import 'package:flutter/material.dart';

import 'home_athlete_state.dart';

class HomeAthleteController extends ChangeNotifier {
  final HomeAthleteState state = HomeAthleteState();

  void onItemTapped(int index) {
    state.selectedIndex = index;
    notifyListeners();
  }
}