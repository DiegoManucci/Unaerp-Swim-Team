import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/application_controller.dart';

import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;

  const LoginForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.state.loginFormKey,
      child: Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(children: [
              TextFormField(
                key: const Key("emailTextFormField"),
                controller: controller.state.emailController,
                validator: controller.emailValidator,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                key: const Key("passwordTextFormField"),
                controller: controller.state.passwordController,
                validator: controller.passwordValidator,
                obscureText: controller.state.showPassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Senha',
                  suffixIcon: IconButton(
                      icon: Icon(
                        !controller.state.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: controller.toggleShowPassword),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => controller.onForgotPassword(context),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                      child: Text('Esqueci a senha'),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<ApplicationController>(
                  builder: (context, applicationController, child) {
                return FilledButton(
                  key: const Key("submitFilledButton"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () {
                    controller.onLogin(context, applicationController);
                  },
                  child: const Text('Entrar'),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              Text(
                controller.state.errorMessage ?? '', // Display the error message here
                style: const TextStyle(color: Colors.red), // You can style the error message
              ),
            ]),
          )),
    );
  }
}