import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'create_user_controller.dart';

class CreateUserView extends StatelessWidget {
  final CreateUserController controller = CreateUserController();

  CreateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<CreateUserController>(
        builder: (context, controller, child) =>
              Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () { Navigator.pop(context); },
                  ),
                  title: const Text(
                    'Cadastrar Usuário',
                    textAlign: TextAlign.center,
                  ),
                  centerTitle: true,
                ),
                body: Text('Cadastrar usuário')
            ),
      ),
    );
  }
}
