import 'package:flutter/material.dart';

class SuggestionCardItem extends StatelessWidget {
  final type;
  final name;
  final height;
  final width;

  const SuggestionCardItem({
    this.type,
    this.name,
    Key key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 7.0,
        vertical: 6.0,
      ),
      child: Container(
        height: height * 0.16,
        width: width * 0.1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[400], blurRadius: 5, offset: Offset(0, 2))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(3),
                  child: Image.asset(
                    'assets/images/logo.jpeg',
                    fit: BoxFit.fitWidth,
                    width: width * 0.2,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Podcast",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.lightBlue[700],
                          fontSize: width * 0.042),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.001, top: width * 0.018),
                          child: Container(
                            width: width * 0.6,
                            child: Text(
                              "Jovem Nerd Nerd Nerd Nerd",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.06,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.008,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
