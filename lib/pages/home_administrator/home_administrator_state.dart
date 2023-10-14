import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/profile/profile_view.dart';
import 'package:unaerp_swim_team/pages/users/users_view.dart';

import '../../types/app_page.dart';

class HomeAdministratorState {
  int _selectedIndex = 0;

  final List<AppPage> _appPages = [
    AppPage(title: 'Usuários', widget: UsersView()),
    AppPage(title: 'Perfil', widget: ProfileView()),
  ];

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
  }

  List<AppPage> get appPages => _appPages;
  List<Widget> get pages => _appPages.map((p) => p.widget).toList();
}