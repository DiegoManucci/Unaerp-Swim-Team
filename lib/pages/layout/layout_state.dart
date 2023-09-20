import 'package:flutter/cupertino.dart';
import 'package:unaerp_swim_team/pages/login/login_view.dart';
import 'package:unaerp_swim_team/pages/users/users_view.dart';

class LayoutState {
  int selectedIndex = 0;

  List<Widget> pages = <Widget>[
    UsersView(),
    LoginView(),
  ];
}