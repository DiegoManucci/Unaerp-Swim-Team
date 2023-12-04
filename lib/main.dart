import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/application_provider.dart';
import 'package:unaerp_swim_team/generated/color_schemes.g.dart';
import 'package:unaerp_swim_team/pages/login/login_view.dart';

import 'firebase_options.dart';

main() async  {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationProvider(
      child: MaterialApp(
        title: 'Unaerp Swim Team',
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
        ),
        home: LoginView()
      ),
    );
  }
}