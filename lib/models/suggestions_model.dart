class SuggestionModel {
  int id;
  String description;
  String imageUrl;
  String title;
  String type;
  String url;

  SuggestionModel({
    this.id,
    this.description,
    this.imageUrl,
    this.title,
    this.type,
    this.url,
  });

  SuggestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    imageUrl = json['image_url'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['title'] = this.title;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
