import 'package:flutter/material.dart';
import 'package:movie_box/main.dart';
import 'dart:async';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MovieBox())
        ));

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Hero(
            tag: 'name',
            child: Text(
              'Movie Box',
              style: TextStyle(
                  color: Colors.deepPurple[900], fontFamily: 'BebasNeue', fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}