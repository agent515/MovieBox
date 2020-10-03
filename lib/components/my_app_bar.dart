import 'package:flutter/material.dart';
import 'package:movie_box/main.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.icon, this.callback});

  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 30.0,
        child: Stack(children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: 'name',
              child: Text(
                'Movie Box',
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 28,
                    color: Colors.deepPurple[900]),
              ),
            ),
          ),
          this.icon != null
              ? Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(this.icon),
                    onPressed: this.callback,
                  ),
                )
              : Container(
                  width: 0,
                )
        ]),
      ),
    );
  }
}
