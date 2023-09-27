import 'package:unaerp_swim_team/types/user_type.dart';

class User {
  String _name;
  String _email;
  UserType _type;

  User(this._name, this._email, this._type);

  String get name => _name;
  String get email => _email;
  UserType get type => _type;

  set name(String name) => _name = name;
  set email(String email) => _email = email;
  set type(UserType type) => _type = type;
}