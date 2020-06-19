import 'package:flutter/material.dart';
import 'package:n2020mobile/models/users_model.dart';
import 'package:n2020mobile/services/user_service.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  UserService userService = UserService();
  UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final padding = 10.0;
    userModel = ModalRoute.of(context).settings.arguments;

    final nomeField = TextFormField(
      initialValue: userModel.name,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: 'Nome',
          hintText: "Nome",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
      validator: (value) {
        if (value.isEmpty) {
          return 'O campo Nome é obrigatório.';
        }
        return null;
      },
      onSaved: (value) {
        userModel.name = value;
      },
    );

    final emailField = TextFormField(
      initialValue: userModel.email,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: 'Email',
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
      initialValue: userModel.password,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: 'Senha',
          hintText: "******",
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

    final phoneField = TextFormField(
      initialValue: userModel.phone,
      obscureText: false,
      style: style,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: 'Telefone',
          hintText: "Telefone",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
      validator: (value) {
        if (value.isEmpty) {
          return 'O campo Telefone é obrigatório.';
        }
        return null;
      },
      onSaved: (value) {
        userModel.phone = value;
      },
    );

    final photoField = TextFormField(
      initialValue: userModel.photoUrl,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: 'Foto de perfil',
          hintText: "Figite a URL da foto",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
      validator: (value) {
        if (value.isEmpty) {
          return 'Adicionar uma URL de imagem válida é obrigatório.';
        }
        return null;
      },
      onSaved: (value) {
        userModel.photoUrl = value;
      },
    );

    return Scaffold(
      appBar: new AppBar(
        title: Text('Perfil - ${userModel.name}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                nomeField,
                SizedBox(
                  height: padding,
                ),
                emailField,
                SizedBox(
                  height: padding,
                ),
                photoField,
                SizedBox(
                  height: padding,
                ),
                passwordField,
                SizedBox(
                  height: padding,
                ),
                phoneField,
                SizedBox(
                  height: padding * 2,
                ),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.blue,
                  child: Text("Atualizar",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500)),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      print(userModel.toJson());
                      userService.update(userModel);
                      Navigator.pop(context);
                      showAlertDialog(context, "Perfil atualizado com sucesso",
                          Icon(Icons.check));
                    } else {
                      showAlertDialog(
                          context,
                          "Não foi possivel atualizar o perfil",
                          Icon(Icons.error));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context, String texto, Icon icone) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: icone,
    content: Text(texto),
  ); // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(ctx).pop(true);
        Navigator.of(context).pop();
      });
      return alert;
    },
  );
}
