import 'package:flutter/cupertino.dart';

class LoginState {

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = true;

  LoginState() {
    _emailController.text = 'teste@teste.com';
    _passwordController.text = '12345678';
  }

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get loginFormKey => _loginFormKey;
  bool get showPassword => _showPassword;
  set showPassword(bool value) {
    _showPassword = value;
  }
}