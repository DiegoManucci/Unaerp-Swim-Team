import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/login/components/login_form.dart';
import 'package:unaerp_swim_team/pages/login/components/login_logo.dart';

import 'login_controller.dart';

class LoginView extends StatefulWidget {
  final LoginController controller = LoginController();

  LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginLogo(),
              LoginForm(),
            ],
          ),
        )
      ),
    );
  }
}
