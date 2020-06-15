import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:n2020mobile/models/chat_message.dart';
import 'package:n2020mobile/models/users_model.dart';
import 'package:n2020mobile/widgets/chat_mesage_list_item.dart';

class BotPage extends StatefulWidget {
  @override
  _BotPageState createState() => _BotPageState();
}

class _BotPageState extends State<BotPage> {
  final _messageList = <ChatMessage>[];
  final _controllerText = new TextEditingController();
  UserModel userModel;

  @override
  void dispose() {
    super.dispose();
    _controllerText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userModel = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: new AppBar(
        title: Text('Goodbot'),
      ),
      body: Column(
        children: <Widget>[
          _buildList(),
          Divider(height: 1.0),
          _buildUserInput(userModel),
        ],
      ),
    );
  }

  // Cria a lista de mensagens (de baixo para cima)
  Widget _buildList() {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        itemBuilder: (_, int index) =>
            ChatMessageListItem(chatMessage: _messageList[index]),
        itemCount: _messageList.length,
      ),
    );
  }

  // Envia uma mensagem com o padrão a direita
  void _sendMessage({String text, UserModel userModel}) {
    _controllerText.clear();
    _addMessage(
      name: userModel.name,
      text: text,
      type: ChatMessageType.sent,
      userId: userModel.id,
    );
    //Cadastrar no banco aqui
  }

  // Adiciona uma mensagem na lista de mensagens
  void _addMessage(
      {String name, String text, ChatMessageType type, int userId}) {
    var message = ChatMessage(
      text: text,
      name: name,
      type: type,
      userId: userModel.id,
    );
    setState(() {
      _messageList.insert(0, message);
    });

    if (type == ChatMessageType.sent) {
      // Envia a mensagem para o chatbot e aguarda sua resposta
      _dialogFlowRequest(query: message.text);
      //Cadastrar no banco aqui
    }
  }

  // Campo para escrever a mensagem
  Widget _buildTextField() {
    return new Flexible(
      child: new TextField(
        controller: _controllerText,
        decoration: new InputDecoration.collapsed(
          hintText: "Enviar mensagem",
        ),
      ),
    );
  }

  // Botão para enviar a mensagem
  Widget _buildSendButton(UserModel userModel) {
    return new Container(
      margin: new EdgeInsets.only(left: 8.0),
      child: new IconButton(
          icon: new Icon(Icons.send, color: Theme.of(context).accentColor),
          onPressed: () {
            if (_controllerText.text.isNotEmpty) {
              _sendMessage(text: _controllerText.text, userModel: userModel);
            }
          }),
    );
  }

  // Monta uma linha com o campo de text e o botão de enviao
  Widget _buildUserInput(UserModel userModel) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          _buildTextField(),
          _buildSendButton(userModel),
        ],
      ),
    );
  }

  Future _dialogFlowRequest({String query}) async {
    // Adiciona uma mensagem temporária na lista
    _addMessage(
        name: 'Eliza', text: 'Escrevendo...', type: ChatMessageType.received);

    // Faz a autenticação com o serviço, envia a mensagem e recebe uma resposta da Intent
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/credentials.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: "pt-BR");
    AIResponse response = await dialogflow.detectIntent(query);

    // remove a mensagem temporária
    setState(() {
      _messageList.removeAt(0);
    });

    // adiciona a mensagem com a resposta do DialogFlow
    _addMessage(
        name: 'Eliza',
        text: response.getMessage() ?? '',
        type: ChatMessageType.received);
  }
}
