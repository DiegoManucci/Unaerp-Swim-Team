
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/create_user/create_user_view.dart';
import 'package:unaerp_swim_team/pages/users/users_state.dart';
import 'package:unaerp_swim_team/pages/users/widgets/users_list_item_actions.dart';
import 'package:unaerp_swim_team/types/user.dart';

import '../../utils/utils.dart';

class UsersController extends ChangeNotifier {
  final UsersState state = UsersState();

  UsersController() {
    setupUsers();
  }

  void setUsers(List<User> users) {
    state.users = users;
  }

  void setupUsers() async {
    List<User> users = await Utils.listUsers();
    setUsers(users);
    notifyListeners();
  }

  void onRemoveUser(BuildContext context, User user) {
    Utils.showCustomAlertDialog(context, 'Excluir usuário', 'Deseja mesmo excluir o usuário: ${user.name}?', [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Cancelar'),
      ),
      TextButton(
        onPressed: () {
          Utils.deleteUser(user.id!);
          state.users = state.users.where((element) => element.id != user.id).toList();
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

  void onAddUser(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateUserView(defaultUserType: null)));
  }
}