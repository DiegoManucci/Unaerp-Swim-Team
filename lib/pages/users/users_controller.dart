
import 'package:flutter/cupertino.dart';
import 'package:unaerp_swim_team/pages/users/users_state.dart';
import 'package:unaerp_swim_team/types/user.dart';

class UsersController extends ChangeNotifier {
  final UsersState state = UsersState();

  void setUsers(List<User> users) {
    state.users = users;
  }

  void onRemoveUser(User user) {
    state.users.remove(user);
    notifyListeners();
  }
}