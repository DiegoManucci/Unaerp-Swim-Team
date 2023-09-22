import 'package:flutter/material.dart';
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
          String userType = '';
          if (user.type == "administrador") {
            userType = "Administrador";
          } else if (user.type == "atleta") {
            userType = "Atleta";
          } else if (user.type == "treinador") {
            userType = "Treinador";
          }
          return Column(
            children: [
              const SizedBox(height: 8), // Add spacing
              Card(
                elevation: 1,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(userType),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              widget.controller.onEditUser(user);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
