enum ChatMessageType { sent, received }

class ChatMessage {
  int id;
  String name;
  String time;
  String content;
  ChatMessageType type;
  int userId;

  ChatMessage({
    this.id,
    this.name,
    this.time,
    this.content,
    this.type = ChatMessageType.sent,
    this.userId,
  });

  ChatMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['type'] == "sent" ? json['name'] : 'Eliza';
    time = json['time'];
    content = json['content'];
    type = json['type'] == "sent"
        ? ChatMessageType.sent
        : ChatMessageType.received;
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    data['type'] = this.type;
    data['userId'] = this.userId;
    return data;
  }
}
