import 'package:n2020mobile/models/suggestions_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SuggestionPage extends StatefulWidget {
  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  SuggestionModel suggestionModel;

  @override
  Widget build(BuildContext context) {
    suggestionModel = ModalRoute.of(context).settings.arguments;
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              suggestionModel.title.toString(),
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue[700],
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
          ),
          body: new WebView(
            initialUrl: suggestionModel.url.toString(),
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
