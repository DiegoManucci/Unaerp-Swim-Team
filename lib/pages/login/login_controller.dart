
import 'package:flutter/cupertino.dart';
import 'package:unaerp_swim_team/pages/login/login_state.dart';

class LoginController {
  final LoginState state = LoginState();

  void setEmail(String email) {
    state.email = email;
  }

  void setPassword(String password) {
    state.password = password;
  }

  void toggleShowPassword() {
    state.showPassword = !state.showPassword;
  }

  bool isEmailValid() {
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(state.email);
  }

  bool isPasswordValid() {
    return state.password.length >= 8;
  }

  //TODO: Implementar login
  void onLogin() {
    if(!isEmailValid() || !isPasswordValid()) {
      return;
    }

    debugPrint('Login');
  }

  //TODO: Implementar esqueci minha senha
  void onForgotPassword() {
    debugPrint('Forgot Password');
  }
}