
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/athletes/athletes_state.dart';
import 'package:unaerp_swim_team/pages/athletes/widgets/athletes_list_item_actions.dart';
import 'package:unaerp_swim_team/pages/create_user/create_user_view.dart';
import 'package:unaerp_swim_team/types/user.dart';

import '../../utils/utils.dart';

class AthletesController extends ChangeNotifier {
  final AthletesState state = AthletesState();

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

  void onOpenActions(BuildContext context, User user, AthletesController controller) {
    Utils.showCustomBottomSheet(context, AthletesListItemActions(user: user, controller: controller));
  }

  void onAddUser(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateUserView(defaultUserType: 2, fetchUsers: () {})));
  }
}