import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/types/user_type.dart';

class ProfileState {
  final GlobalKey<FormState> _profileFormKey = GlobalKey<FormState>();

  final List<bool> _profileTypesController = <bool>[true, false, false];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _profileType = UserType.administrador.name;

  bool _showPassword = true;

  ProfileState() {
    _nameController.text = 'teste';
    _emailController.text = 'teste@teste.com';
    _passwordController.text = '12345678';
  }

  GlobalKey<FormState> get profileFormKey => _profileFormKey;

  List<bool> get profileTypesController => _profileTypesController;

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  String get profileType => _profileType;
  set profileType(String value) {
    _profileType = value;
  }

  bool get showPassword => _showPassword;
  set showPassword(bool value) {
    _showPassword = value;
  }
}