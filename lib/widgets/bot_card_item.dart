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
    return GestureDetector(
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
        margin: EdgeInsets.all(20.0),
        height: 150,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 140,
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
            Positioned(
              child: Container(
                height: 205,
                width: 360,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            image,
                            width: 100,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: RichText(
                            maxLines: 3,
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text:
                                      "Precisa de um amigo?\nconverse com a\n",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: "$name\n",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
