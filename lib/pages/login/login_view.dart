import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _showPassword = false;

  void onToggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
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
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      obscureText: _showPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Senha',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: onToggleShowPassword,
                        ),
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
                              onTap: () => {debugPrint('tapped')}),
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
                      onPressed: () => {debugPrint('tapped')},
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
