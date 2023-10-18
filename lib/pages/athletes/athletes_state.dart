import 'package:unaerp_swim_team/types/user.dart';
import 'package:unaerp_swim_team/types/user_type.dart';

class AthletesState {
  List<User> _users = [
    User('Atleta 1', 'atleta1@example.com', '', UserType.atleta),
    User('Atleta 2', 'atleta2@example.com', '', UserType.atleta),
    User('Atleta 3', 'atleta1@example.com', '', UserType.atleta),
    User('Atleta 4', 'atleta2@example.com', '', UserType.atleta),
  ];

  List<User> get users => _users;
  set users(List<User> users) => _users = users;
}