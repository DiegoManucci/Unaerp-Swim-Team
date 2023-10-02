import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/types/user_type.dart';

class ProfileState {
  final GlobalKey<FormState> _profileFormKey = GlobalKey<FormState>();

  final TextEditingController _profileType = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayDateController = TextEditingController();
  final TextEditingController _rgController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();


  ProfileState() {
    _profileType.text = UserType.administrador.name;
    _nameController.text = 'Diego Brino';
    _emailController.text = 'diego@brino.com';
    _birthdayDateController.text = '99/99/9999';
    _rgController.text = '43.538.449-1';
    _cpfController.text = '334.217.530-32';
    _sexController.text = 'Masculino';
    _phoneController.text = '+55 (99) 99999-9999';
  }

  GlobalKey<FormState> get profileFormKey => _profileFormKey;

  TextEditingController get profileType => _profileType;
  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get birthdayDateController => _birthdayDateController;
  TextEditingController get rgController => _rgController;
  TextEditingController get cpfController => _cpfController;
  TextEditingController get sexController => _sexController;
  TextEditingController get phoneController => _phoneController;
}