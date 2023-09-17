import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/generated/color_schemes.g.dart';
import 'package:unaerp_swim_team/pages/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      home: LoginView()
    );
  }
}
