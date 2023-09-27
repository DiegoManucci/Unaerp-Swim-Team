import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/users/components/users_card.dart';
import 'package:unaerp_swim_team/pages/users/users_controller.dart';

class UsersView extends StatefulWidget {
  final UsersController controller = UsersController();

  UsersView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Usuários", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: widget.controller.state.users.length,
        itemBuilder: (context, index) {
          final user = widget.controller.state.users[index];
          return Column(
            children: [
              const SizedBox(height: 8), // Add spacing
              UsersCard(user: user)
            ],
          );
        },
      ),
    );
  }
}
