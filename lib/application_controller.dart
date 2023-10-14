
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/application_state.dart';
import 'package:unaerp_swim_team/types/user.dart';

class ApplicationController extends ChangeNotifier {
  final ApplicationState _state = ApplicationState();

  User? get user => _state.user;
  set user(User? value) {
    _state.user = value;
    notifyListeners();
  }
}