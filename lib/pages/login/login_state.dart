import 'package:flutter/material.dart';

class LoginState {

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = true;

  LoginState() {
    _emailController.text = 'administrador@administrador.com';
    _passwordController.text = 'administrador';
  }

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get loginFormKey => _loginFormKey;
  bool get showPassword => _showPassword;
  set showPassword(bool value) {
    _showPassword = value;
  }
}