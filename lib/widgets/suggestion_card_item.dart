import 'package:flutter/material.dart';

class SuggestionCardItem extends StatelessWidget {
  final type;
  final name;
  final image;
  final url;
  final height;
  final width;

  const SuggestionCardItem({
    this.type,
    this.name,
    this.image =
        "https://www.bauducco.com.br/wp-content/uploads/2017/09/default-placeholder-1-2.png",
    this.url,
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
        vertical: 2.0,
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
                  child: Image.network(
                    image,
                    fit: BoxFit.fitWidth,
                    width: width * 0.2,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type,
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
                              name,
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
