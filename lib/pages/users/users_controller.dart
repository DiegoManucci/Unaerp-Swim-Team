
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/users/users_state.dart';
import 'package:unaerp_swim_team/pages/users/widgets/users_list_item_actions.dart';
import 'package:unaerp_swim_team/types/user.dart';

import '../../utils/utils.dart';

class UsersController extends ChangeNotifier {
  final UsersState state = UsersState();

  void setUsers(List<User> users) {
    state.users = users;
  }

  void onRemoveUser(BuildContext context, User user) {
    Utils.showCustomAlertDialog(context, 'Excluir usuário', 'Deseja mesmo excluir o usuário: ${user.name}?', [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Cancelar'),
      ),
      TextButton(
        onPressed: () {
          state.users.remove(user);
          Utils.showCustomSnackBar(context, "Usuário: ${user.name} excluído com sucesso!");
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          notifyListeners();
        },
        child: const Text('Excluir'),
      ),
    ]);
  }

  void onOpenActions(BuildContext context, User user, UsersController controller) {
    Utils.showCustomBottomSheet(context, UsersListItemActions(user: user, controller: controller));
  }
}