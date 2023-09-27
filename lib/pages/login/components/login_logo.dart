import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
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
    );
  }
}
