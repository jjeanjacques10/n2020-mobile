import 'dart:convert';

class AlunoModel {
  int id;
  String title;
  int type;
  String description;
  String url;
  String image_url;
  String id_categories;

  AlunoModel({
    this.id,
    this.title,
    this.type,
    this.description,
    this.url,
    this.image_url,
    this.id_categories,
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
        image_url: json["image_url"],
        id_categories: json["id_categories"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "type": type,
        "description": description,
        "url": url,
        "image_url": image_url,
        "id_categories": id_categories,
      };
}