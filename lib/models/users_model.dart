class UserModel {
  int id;
  String email;
  String name;
  String password;
  String phone;
  String photoUrl;

  UserModel({
    this.id,
    this.email,
    this.name,
    this.password,
    this.phone,
    this.photoUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}
