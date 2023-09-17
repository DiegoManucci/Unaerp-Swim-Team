import 'package:flutter/material.dart';

import 'login_controller.dart';

class LoginView extends StatefulWidget {
  final LoginController controller = LoginController();

  LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.controller.state.email;
    _passwordController.text = widget.controller.state.password;
  }

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
            const Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: Image(
                      fit: BoxFit.fitWidth,
                      filterQuality: FilterQuality.high,
                      image: AssetImage("assets/images/wave_logo.png"),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 200,
                  child: Text(
                    'NATAÇÃO UNAERP',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(children: [
                    TextField(
                      controller: _emailController,
                      onChanged: (value) {
                        widget.controller.setEmail(value);
                      },
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Email',
                        errorText: widget.controller.isEmailValid()
                            ? null
                            : 'Email inválido',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _passwordController,
                      onChanged: (value) {
                        widget.controller.setPassword(value);
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
                        errorText: widget.controller.isPasswordValid()
                            ? null
                            : 'Senha deve ter no mínimo 8 caracteres',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                                child: Text('Esqueci a senha'),
                              ),
                              onTap: () =>
                                  {widget.controller.onForgotPassword()}),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FilledButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        widget.controller.onLogin();
                      },
                      child: const Text('Entrar'),
                    ),
                  ]),
                )),
          ],
        ),
      )),
    );
  }
}
