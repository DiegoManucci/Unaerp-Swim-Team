
import 'package:flutter/cupertino.dart';
import 'package:unaerp_swim_team/pages/users/users_state.dart';
import 'package:unaerp_swim_team/types/user.dart';

class UsersController {
  final UsersState state = UsersState();

  void setUsers(List<User> users) {
    state.users = users;
  }

  void onEditUser(User user) {
    debugPrint("Editando usuário ${user.name}");
  }
}