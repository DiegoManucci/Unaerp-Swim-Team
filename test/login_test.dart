import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unaerp_swim_team/pages/login/login_view.dart';

void main() {
  testWidgets("Teste de login", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginView(),
    ));

    final emailTextFormField = find.byKey(const Key('emailTextFormField'));
    expect(emailTextFormField, findsOneWidget);
    await tester.enterText(emailTextFormField, 'diego.brino@sou.unaerp.edu.br');

    final passwordTextFormField = find.byKey(const Key('passwordTextFormField'));
    expect(passwordTextFormField, findsOneWidget);
    await tester.enterText(passwordTextFormField, 'teste123');

    final submitFilledButton = find.byKey(const Key('submitFilledButton'));
    expect(submitFilledButton, findsOneWidget);

    await tester.tap(submitFilledButton);
    await tester.pump();

    expect(find.byKey(const Key('homeTrainerAppBar')), findsNWidgets(1));
  });
}