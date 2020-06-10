import 'package:flutter/material.dart';
import 'package:n2020mobile/views/bot_page.dart';

class BotListCard extends StatelessWidget {
  final String image;
  final String name;
  final String auth;
  final Function pressDetails;
  final Function pressRead;

  const BotListCard({
    Key key,
    this.image,
    this.name,
    this.auth,
    this.pressDetails,
    this.pressRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 40),
      height: 250,
      width: 450,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: Colors.grey[350],
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            image,
            width: 150,
          ),
          Positioned(
            top: 160,
            child: Container(
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 3,
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Precisa de um amigo? converse com a\n",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          TextSpan(
                            text: "$name\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return BotPage();
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: 101,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text("Conversar"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
