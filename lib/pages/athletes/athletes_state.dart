import 'package:unaerp_swim_team/types/user.dart';

class AthletesState {
  List<User> _users = [

  ];

  List<User> get users => _users;
  set users(List<User> users) => _users = users;
}