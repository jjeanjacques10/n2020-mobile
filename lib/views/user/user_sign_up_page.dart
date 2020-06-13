import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final padding = 12.0;

    final nomeField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
        // professorModel.nome = value;
      },
    );

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
        // professorModel.nome = value;
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
        // professorModel.nome = value;
      },
    );

    final phoneField = TextFormField(
      obscureText: false,
      style: style,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
        // professorModel.nome = value;
      },
    );

    final photoField = TextFormField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "URL da foto",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(16.0))),
      validator: (value) {
        if (value.isEmpty) {
          return 'O campo Foto é obrigatório.';
        }
        return null;
      },
      onSaved: (value) {
        // professorModel.nome = value;
      },
    );

    return Scaffold(
      appBar: new AppBar(
        title: Text('Novo Usuário'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
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
              height: padding*2,
            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              color: Colors.blue,
              child: Text("Cadastrar",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500)),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  formKey.currentState.save();
                  //professorRepository.create(professorModel);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return null;
                    }),
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
