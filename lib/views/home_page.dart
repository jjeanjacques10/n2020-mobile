import 'package:flutter/material.dart';
import 'package:n2020mobile/widgets/bot_card_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Goodbot'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: BotListCard(image: '', name: 'Eliza', auth: ''),
          ),
          Text(
            'Sugestões',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
