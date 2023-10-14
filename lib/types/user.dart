import 'package:unaerp_swim_team/types/user_type.dart';

class User {
  String _name;
  String _email;
  String _password;
  UserType _type;

  User(this._name, this._email, this._password, this._type);

  String get name => _name;
  String get email => _email;
  String get password => _password;
  UserType get type => _type;

  set name(String name) => _name = name;
  set email(String email) => _email = email;
  set password(String password) => _password = password;
  set type(UserType type) => _type = type;
}