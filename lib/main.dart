import 'package:flutter/material.dart';
import 'package:n2020mobile/views/bot_page.dart';
import 'package:n2020mobile/views/home_page.dart';
import 'package:n2020mobile/views/login_page.dart';
import 'package:n2020mobile/views/user/user_sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Goodbot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => HomePage(),
        '/bot': (context) => BotPage(),
        '/login': (context) => LoginPage(),
        '/user-signup': (context) => UserSignUp()
      },
    );
  }
}
