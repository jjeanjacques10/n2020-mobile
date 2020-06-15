enum ChatMessageType { sent, received }

class ChatMessage {
  String name;
  String text;
  ChatMessageType type;
  int userId;

  ChatMessage({
    this.name,
    this.text,
    this.type = ChatMessageType.sent,
    this.userId,
  });

  ChatMessage.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    text = json['text'];
    type = json['type'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['text'] = this.text;
    data['type'] = this.type;
    data['userId'] = this.userId;
    return data;
  }
}
