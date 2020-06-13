import 'dart:convert';

class AlunoModel {
  int id;
  String photoUrl;
  int name;
  String phone;
  String email;
  String password;
  

  AlunoModel({
    this.id,
    this.photoUrl,
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