import 'package:flutter/material.dart';
import 'package:n2020mobile/models/chat_message.dart';
import 'package:n2020mobile/models/users_model.dart';

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage chatMessage;
  final UserModel userModel;

  ChatMessageListItem({this.chatMessage, this.userModel});

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == ChatMessageType.sent
        ? _showSentMessage()
        : _showReceivedMessage();
  }

  Widget _showSentMessage({EdgeInsets padding, TextAlign textAlign}) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 0.0),
      trailing: CircleAvatar(
        backgroundImage: NetworkImage(userModel.photoUrl),
      ),
      title: Container(
        margin: EdgeInsets.only(left: 50),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(17.0),
          ),
        ),
        child: Text(
          chatMessage.content,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Widget _showReceivedMessage() {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/elisa.jpg'),
      ),
      title: Text(
        chatMessage.content,
        textAlign: TextAlign.left,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
