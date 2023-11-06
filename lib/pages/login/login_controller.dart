
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/application_controller.dart';
import 'package:unaerp_swim_team/pages/home_athlete/home_athlete_view.dart';
import 'package:unaerp_swim_team/pages/home_trainer/home_trainer_view.dart';
import 'package:unaerp_swim_team/pages/login/login_state.dart';
import 'package:unaerp_swim_team/types/user_type.dart';
import 'package:unaerp_swim_team/utils/utils.dart';

import '../../types/user.dart';
import '../home_administrator/home_administrator_view.dart';

class LoginController extends ChangeNotifier {
  final LoginState state = LoginState();

  void toggleShowPassword() {
    state.showPassword = !state.showPassword;
    notifyListeners();
  }

  void onForgotPassword() {
    debugPrint('Forgot Password');
  }

  void onLogin(context, ApplicationController applicationController) {
    if (!state.loginFormKey.currentState!.validate()) {
      return;
    }

    List<User> users = [
      User(
        'Administrador',
        'administrador@administrador.com',
        '12345678',
        UserType.administrador,
      ),
      User(
        'Atleta',
        'atleta@atleta.com',
        '12345678',
        UserType.atleta,
      ),
      User(
        'Treinador',
        'treinador@treinador.com',
        '12345678',
        UserType.treinador,
      ),
    ];

    applicationController.user = users
        .firstWhere((user) => user.email == state.emailController.text && user.password == state.passwordController.text);

    Widget? destination;

    switch(applicationController.user!.type) {
      case UserType.administrador:
        destination = HomeAdministratorView();
        break;
      case UserType.atleta:
        destination = HomeAthleteView();
        break;
      case UserType.treinador:
        destination = HomeTrainerView();
        break;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => destination!),
          (Route<dynamic> route) => false,
    );
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!Utils.doesEmailMatchRegex(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!Utils.doesPasswordHaveAtLeastEightCharacters(value)) {
      return 'Senha deve ter pelo menos 8 caracteres';
    }
    return null;
  }
}