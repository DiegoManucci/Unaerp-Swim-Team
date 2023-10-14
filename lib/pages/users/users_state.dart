import 'package:unaerp_swim_team/types/user.dart';
import 'package:unaerp_swim_team/types/user_type.dart';

class UsersState {
  List<User> _users = [
    User('Administrador 1', 'admin1@example.com', '', UserType.administrador),
    User('Atleta 1', 'atleta1@example.com', '', UserType.atleta),
    User('Treinador 1', 'treinador1@example.com', '', UserType.treinador),
    User('Administrador 2', 'admin2@example.com', '', UserType.administrador),
    User('Atleta 2', 'atleta2@example.com', '', UserType.atleta),
    User('Treinador 2', 'treinador2@example.com', '', UserType.treinador),
    User('Administrador 3', 'admin1@example.com', '', UserType.administrador),
    User('Atleta 3', 'atleta1@example.com', '', UserType.atleta),
    User('Treinador 3', 'treinador1@example.com', '', UserType.treinador),
    User('Administrador 4', 'admin2@example.com', '', UserType.administrador),
    User('Atleta 4', 'atleta2@example.com', '', UserType.atleta),
    User('Treinador 4', 'treinador2@example.com', '', UserType.treinador),
  ];

  List<User> get users => _users;
  set users(List<User> users) => _users = users;
}