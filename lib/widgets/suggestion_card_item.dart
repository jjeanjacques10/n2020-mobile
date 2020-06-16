import 'package:flutter/material.dart';
import 'package:n2020mobile/models/suggestions_model.dart';

class SuggestionCardItem extends StatelessWidget {
  final height;
  final width;
  final SuggestionModel suggestionModel;

  const SuggestionCardItem({
    Key key,
    this.height,
    this.width,
    this.suggestionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5.0,
          margin: new EdgeInsets.symmetric(
            horizontal: 7.0,
            vertical: 5.0,
          ),
          child: Container(
            height: height * 0.20,
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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 10),
                      child: Image.network(
                        suggestionModel.imageUrl,
                        fit: BoxFit.fitWidth,
                        width: width * 0.2,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          suggestionModel.type,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: colorTypeSuggestion(suggestionModel.type),
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
                                  suggestionModel.title,
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
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/suggestionsweb',
            arguments: suggestionModel,
          );
        });
  }

  Color colorTypeSuggestion(typeSuggestion) {
    switch (typeSuggestion) {
      case "Livros":
        return Colors.red[700];
        break;
      case "Música":
        return Colors.green[700];
        break;
      default:
        return Colors.lightBlue[700];
    }
  }
}
