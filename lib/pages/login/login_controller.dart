
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/login/login_state.dart';

import '../home/home_view.dart';

class LoginController extends ChangeNotifier {
  final LoginState state = LoginState();

  void toggleShowPassword() {
    state.showPassword = !state.showPassword;
    notifyListeners();
  }

  void onForgotPassword() {
    debugPrint('Forgot Password');
  }

  void onLogin(context) {
    if (!state.loginFormKey.currentState!.validate()) {
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeView()),
          (Route<dynamic> route) => false,
    );
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!_doesEmailMatchRegex(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  bool _doesEmailMatchRegex(String value) {
    String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(value);
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!_doesPasswordHaveAtLeastEightCharacters(value)) {
      return 'Senha deve ter pelo menos 8 caracteres';
    }
    return null;
  }

  bool _doesPasswordHaveAtLeastEightCharacters(value) {
    return value.length >= 8;
  }
}
