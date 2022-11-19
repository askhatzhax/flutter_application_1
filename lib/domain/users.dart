import 'dart:convert';

class Users {
  final String name;
  final String email;
  final String sometext;
  const Users(
      {required this.name, required this.email, required this.sometext});

  /*static Users fromJson(json) => Users(
      name: json['name'], email: json['email'], sometext: json['username']);*/
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        name: json['name'] as String,
        email: json['email'] as String,
        sometext: json['username'] as String);
  }
}
