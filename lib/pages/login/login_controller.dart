
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/application_controller.dart';
import 'package:unaerp_swim_team/pages/home_athlete/home_athlete_view.dart';
import 'package:unaerp_swim_team/pages/home_trainer/home_trainer_view.dart';
import 'package:unaerp_swim_team/pages/login/login_state.dart';
import 'package:unaerp_swim_team/utils/utils.dart';

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

  Future<void> onLogin(context, ApplicationController applicationController) async {
    if (!state.loginFormKey.currentState!.validate()) {
      return;
    }

    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: state.emailController.text,
        password: state.passwordController.text,
      );

      firebase_auth.User? user = userCredential.user;

      String? userType = await Utils.getUserType(user!.uid);

      Widget? destination;

      switch(userType) {
        case "administrador":
          destination = HomeAdministratorView();
          break;
        case "atleta":
          destination = HomeAthleteView();
          break;
        case "treinador":
          destination = HomeTrainerView();
          break;
      }

      destination = HomeAdministratorView();

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => destination!),
            (Route<dynamic> route) => false,
      );

    } catch (e) {
      print('Erro no login: $e');
    }
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