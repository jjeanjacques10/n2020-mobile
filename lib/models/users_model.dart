import 'dart:convert';

class AlunoModel {
  int id;
  String photo_url;
  int name;
  String phone;
  String email;
  String password;
  

  AlunoModel({
    this.id,
    this.photo_url,
    this.name,
    this.phone,
    this.email,
    this.password,
  });

  factory AlunoModel.fromJson(String str) =>
      AlunoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AlunoModel.fromMap(Map<String, dynamic> json) => AlunoModel(
        id: json["id"],
        photo_url: json["photo_url"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "photo_url": photo_url,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
      };
}