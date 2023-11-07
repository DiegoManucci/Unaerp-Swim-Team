import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/profile/profile_view.dart';
import 'package:unaerp_swim_team/pages/workouts/workouts_view.dart';

import '../../types/app_page.dart';

class HomeAthleteState {
  int _selectedIndex = 0;

  final List<AppPage> _appPages = [
    AppPage(title: 'Treinos', widget: WorkoutsView()),
    AppPage(title: 'Perfil', widget: ProfileView()),
  ];

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
  }

  List<AppPage> get appPages => _appPages;
  List<Widget> get pages => _appPages.map((p) => p.widget).toList();
}