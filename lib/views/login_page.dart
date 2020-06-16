import 'package:flutter/material.dart';
import 'package:n2020mobile/models/users_model.dart';
import 'package:n2020mobile/services/user_service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  UserService userService = UserService();
  UserModel userModel = UserModel();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
      validator: (value) {
        if (value.isEmpty) {
          return 'O campo Email é obrigatório.';
        }
        return null;
      },
      onSaved: (value) {
        userModel.email = value;
      },
    );
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Senha",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
      validator: (value) {
        if (value.isEmpty) {
          return 'O campo Senha é obrigatório.';
        }
        return null;
      },
      onSaved: (value) {
        userModel.password = value;
      },
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 160.0,
                    child: Image.asset(
                      "assets/images/logo.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.white,
                        child: Text("Cadastrar",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500)),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/user-signup",
                          );
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        color: Colors.blue,
                        child: Text("Entrar",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();

                            userService
                                .getLogin(userModel.email.replaceAll("	", ""),
                                    userModel.password)
                                .then((user) {
                              try {
                                if (user is UserModel) {
                                  Navigator.pushNamed(
                                    context,
                                    "/",
                                    arguments: user,
                                  );
                                } else {
                                  scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Não foi cadastrar um novo professor',
                                      ),
                                    ),
                                  );
                                }
                              } catch (e) {
                                scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Não foi cadastrar um novo professor',
                                    ),
                                  ),
                                );
                                print(e);
                              }
                            });
                          } else {
                            scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Não foi cadastrar um novo professor',
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FlatButton(
                    child: Text(
                      'Esqueci minha senha',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
