import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/pages/login/widgets/login_form.dart';
import 'package:unaerp_swim_team/pages/login/widgets/login_logo.dart';

import 'login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = LoginController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<LoginController>(builder: (context, controller, child) {
        return Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LoginLogo(),
              LoginForm(controller: controller),
            ],
          ),
        );
      }),
    );
  }
}
