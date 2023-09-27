import 'package:flutter/material.dart';

import '../../../types/user.dart';
import '../../../utils/utils.dart';

class UsersCard extends StatelessWidget {
  final User user;

  const UsersCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(Utils.initcap(user.type.name)),
                IconButton(
                  icon: const Icon(Icons.close_outlined),
                  onPressed: () {
                    //widget.controller.onEditUser(user);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}