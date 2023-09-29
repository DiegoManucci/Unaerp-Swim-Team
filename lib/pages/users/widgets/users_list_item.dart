import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/users/users_controller.dart';

import '../../../types/user.dart';
import '../../../utils/utils.dart';

class UsersListItem extends StatelessWidget {
  final UsersController controller;
  final User user;

  const UsersListItem({super.key, required this.user, required this.controller});

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
                    Utils.showCustomAlertDialog(
                      context,
                      "Confirmação",
                      "Deseja realmente excluir o usuário ${user.name}?",
                      [
                        TextButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text("Cancelar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text("Confirmar"),
                          onPressed: () {
                            controller.onRemoveUser(user);
                            Navigator.of(context).pop();
                            Utils.showCustomSnackBar(context, "Usuário: ${user.name} excluído com sucesso!");
                          }
                        ),
                      ],
                    );
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
