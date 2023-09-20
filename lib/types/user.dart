class User {
  String _name;
  String _email;
  String _type;

  User(this._name, this._email, this._type);

  String get name => _name;
  String get email => _email;
  String get type => _type;

  set name(String name) => _name = name;
  set email(String email) => _email = email;
  set type(String type) => _type = type;
}