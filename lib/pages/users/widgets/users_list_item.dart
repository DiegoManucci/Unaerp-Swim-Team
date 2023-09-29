import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/users/users_controller.dart';

import '../../../types/user.dart';

class UsersListItem extends StatelessWidget {
  final UsersController controller;
  final User user;

  const UsersListItem(
      {super.key, required this.user, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ListTile(
            dense: true,
            leading: const Icon(Icons.person_outline),
            title: Text(user.name),
            subtitle: Text(user.type.name),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert_outlined),
              onPressed: () { controller.onOpenActions(context, user, controller); },
            ),
          ),
        ],
      ),
    );
  }
}
