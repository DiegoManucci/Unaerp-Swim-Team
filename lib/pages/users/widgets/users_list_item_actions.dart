import 'package:flutter/material.dart';

import '../../../types/user.dart';
import '../users_controller.dart';

class UsersListItemActions extends StatelessWidget {
  final UsersController controller;
  final User user;

  const UsersListItemActions({super.key, required this.user, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            user.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ListTile(
          leading: const Icon(Icons.delete_outline),
          title: const Text("Excluir"),
          onTap: () {
            controller.onRemoveUser(context, user);
          },
        ),
      ],
    );
  }
}
