
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

  void onForgotPassword(BuildContext context) {
    String email = ''; // Initialize an empty email value

    Utils.showCustomDialog(
      context,
      'Esqueci a senha',
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Insira seu e-mail para resetar sua senha.'),
          TextFormField(
            onChanged: (value) {
              email = value; // Update the email variable when the user types
            },
            decoration: InputDecoration(
              labelText: 'E-mail',
            ),
          ),
        ],
      ),
      [
        TextButton(
          onPressed: () => Navigator.pop(context), // Close the dialog
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () async {
            try {
              await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
              Navigator.pop(context); // Close the dialog
              Utils.showCustomDialog(
                  context,
                  'Email enviado',
                  Text('Um email foi enviado para $email com instruções para resetar sua senha.'),
                  [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
                  ]);
            } catch (e) {
              Navigator.pop(context); // Close the dialog
              Utils.showCustomDialog(
                  context,
                  'Erro',
                  Text('Não foi possível enviar o email.'),
                  [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
                  ]);
            }
          },
          child: Text('Enviar'),
        ),
      ],
    );
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
      state.errorMessage = 'Email ou senha inválidos';
      state.loginFormKey.currentState!.validate();
      notifyListeners();
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