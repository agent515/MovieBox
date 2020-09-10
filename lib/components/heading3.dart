import 'package:flutter/material.dart';

class Heading3 extends StatelessWidget {
  Heading3({this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        this.title,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black54,
          fontFamily: 'SurceSansPro',
          letterSpacing: 1.7,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
