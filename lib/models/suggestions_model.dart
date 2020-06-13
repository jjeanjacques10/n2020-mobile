import 'dart:convert';

class AlunoModel {
  int id;
  String title;
  int type;
  String description;
  String url;
  String imageUrl;
  String idCategories;

  AlunoModel({
    this.id,
    this.title,
    this.type,
    this.description,
    this.url,
    this.imageUrl,
    this.idCategories,
  });

  factory AlunoModel.fromJson(String str) =>
      AlunoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AlunoModel.fromMap(Map<String, dynamic> json) => AlunoModel(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        description: json["description"],
        url: json["url"],
        imageUrl: json["imageUrl"],
        idCategories: json["idCategories"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "type": type,
        "description": description,
        "url": url,
        "imageUrl": imageUrl,
        "idCategories": idCategories,
      };
}