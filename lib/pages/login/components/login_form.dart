import 'package:flutter/material.dart';

import '../login_controller.dart';

class LoginForm extends StatefulWidget {
  final LoginController controller = LoginController();

  LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.controller.state.email;
    _passwordController.text = widget.controller.state.password;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              TextFormField(
                controller: _emailController,
                onChanged: (value) {
                  widget.controller.setEmail(value);
                },
                validator: (value) {
                  debugPrint(value);
                  return widget.controller.emailValidator(value);
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _passwordController,
                onChanged: (value) {
                  widget.controller.setPassword(value);
                },
                validator: (value) {
                  return widget.controller.passwordValidator(value);
                },
                obscureText: widget.controller.state.showPassword,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Senha',
                  suffixIcon: IconButton(
                      icon: Icon(
                        !widget.controller.state.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.controller.toggleShowPassword();
                        });
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                        child: Text('Esqueci a senha'),
                      ),
                      onTap: () => {widget.controller.onForgotPassword()}),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  widget.controller.onLogin(context, _formKey);
                },
                child: const Text('Entrar'),
              ),
            ]),
          )),
    );
  }
}
