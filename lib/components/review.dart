import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';

class Review extends StatelessWidget {

  Review({@required this.author, @required this.comment});
  final String author;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.author,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.deepPurple,
              fontFamily: 'SourceSansPro',
              fontSize: 12.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          Card(
            elevation: 0.0,
            child: ExpandText(
              this.comment,
              textAlign: TextAlign.justify,
              maxLines: 4,
              expandArrowStyle: ExpandArrowStyle.icon,
              expandOnGesture: false,
              style: TextStyle(
                decoration: TextDecoration.none,
                color:Colors.black54.withOpacity(0.7),
                fontFamily: 'SourceSansPro',
                fontSize: 12.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
