class SuggestionModel {
  String id;
  String title;
  String type;
  String description;
  String url;
  String imageUrl;

  SuggestionModel(
      {this.id,
      this.title,
      this.type,
      this.description,
      this.url,
      this.imageUrl});

  SuggestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    description = json['description'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['description'] = this.description;
    data['url'] = this.url;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
