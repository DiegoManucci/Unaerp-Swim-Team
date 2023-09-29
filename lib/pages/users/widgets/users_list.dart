import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/users/widgets/users_list_item.dart';

import '../users_controller.dart';

class UsersList extends StatelessWidget {
  final UsersController controller;

  const UsersList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.state.users.length,
      itemBuilder: (context, index) {
        if (index < controller.state.users.length - 1) {
          final user = controller.state.users[index];
          return Column(
            children: [
              const SizedBox(height: 8),
              UsersListItem(user: user, controller: controller),
            ],
          );
        } else {
          return const SizedBox(
            height: 86,
          );
        }
      },
    );
  }
}
