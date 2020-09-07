import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 30.0,
      child: Hero(
        tag: 'name',
        child: Text(
          'Movie Box',
          style: TextStyle(fontFamily: 'BebasNeue', fontSize: 28, color: Colors.deepPurple[900]),
        ),
      ),
    );
  }
}
