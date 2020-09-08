import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {

  CategoryBox({@required this.boxColor, @required this.textColor, @required this.text,@required this.onTapCallback});
  final Color boxColor;
  final Color textColor;
  final String text;
  final Function onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: this.onTapCallback,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.0),
              color: this.boxColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 1),
                ),
              ]
          ),
          child: Center(
            child: Text(
              this.text,
              style: TextStyle(
                color: this.textColor,
                fontFamily: 'SourceSansPro',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
