import 'package:flutter/material.dart';
import 'package:n2020mobile/models/suggestions_model.dart';
import 'package:n2020mobile/models/users_model.dart';
import 'package:n2020mobile/services/suggestions_service.dart';
import 'package:n2020mobile/widgets/suggestion_card_item.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var total;
  var width;
  var height;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    SuggestionService suggestionService = SuggestionService();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    userModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: true,
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                userModel.name,
                style: TextStyle(fontSize: 22),
              ),
              accountEmail: Text(
                userModel.email,
                style: TextStyle(fontSize: 15),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(userModel.photoUrl),
                backgroundColor: Colors.transparent,
              ),
            ),
            ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Perfil"),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/profile',
                    arguments: userModel,
                  );
                }),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text("Ligar para CVV"),
              onTap: () => launch("tel://188"),
            ),
            ListTile(
              leading: Icon(Icons.warning),
              title: Text("Disque denúncia"),
              onTap: () => launch("tel://100"),
            ),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Sair"),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                })
          ],
        ),
      ),
      body: SingleChildScrollView(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: height * 0.334,
                  color: Colors.white,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      width: double.infinity,
                      height: height * 0.28,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[700],
                      )),
                ),
                Positioned(
                  top: width * 0.15,
                  left: width * 0.085,
                  child: Text(
                    "Olá, ${userModel.name}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Positioned(
                  top: width * 0.13,
                  left: width * 0.78,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: width * 0.07,
                  right: width * 0.07,
                  child: Container(
                    height: height * 0.16,
                    width: width * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[400],
                              blurRadius: 5,
                              offset: Offset(0, 2))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * 0.05,
                            top: width * 0.04,
                            bottom: width * 0.02,
                          ),
                          child: Text(
                            "Venha converse com a",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: width * 0.04),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.05),
                              child: Container(
                                width: width * 0.6,
                                child: Text(
                                  "Elisa",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.lightBlue[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * 0.1,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.04),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/bot",
                                    arguments: userModel,
                                  );
                                },
                                child: Container(
                                  width: width * 0.12,
                                  height: width * 0.12,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue[700],
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 7,
                                          offset: Offset(2, 2),
                                        )
                                      ]),
                                  child: Icon(
                                    Icons.chat,
                                    size: width * 0.07,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.008,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 35, left: 22),
                      child: Text(
                        "Sugestões:",
                        style: TextStyle(
                            color: Colors.grey[600], fontSize: width * 0.045),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              child: Expanded(
                child: SizedBox(
                  height: height * 0.6,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Scaffold(
                      key: scaffoldKey,
                      body: FutureBuilder<List>(
                        future: suggestionService.findAll(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            String erroMessage = snapshot.error.toString();
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Erro ao carregar a lista de cursos. \n Detalhes: $erroMessage'),
                              ),
                            );
                          } else {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.data.length > 0) {
                                List<SuggestionModel> suggestions =
                                    snapshot.data;
                                return ListView.builder(
                                  itemCount: suggestions.length,
                                  itemBuilder: (ctx, index) {
                                    return SuggestionCardItem(
                                      height: height,
                                      width: width,
                                      suggestionModel: suggestions[index],
                                    );
                                  },
                                );
                                //return buildListView(snapshot.data);
                              } else {
                                return Center(
                                  child: Text("Nenhum curso cadastrado!"),
                                );
                              }
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
