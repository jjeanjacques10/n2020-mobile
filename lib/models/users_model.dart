import 'dart:convert';

class UserModel {
  int id;
  String photoUrl;
  int name;
  String phone;
  String email;
  String password;

  UserModel({
    this.id,
    this.photoUrl,
    this.name,
    this.phone,
    this.email,
    this.password,
  });

  factory UserModel.fromJson(String str) =>
      UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        photoUrl: json["photoUrl"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "photoUrl": photoUrl,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      };
}