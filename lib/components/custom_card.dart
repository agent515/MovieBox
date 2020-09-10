import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCard extends StatelessWidget {

  CustomCard({this.property, this.value});
  final String property;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Colors.deepPurple.withOpacity(0.2),
          width: 2.0,
        )
      ),
      elevation: 2.0,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  this.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.deepPurple[900],
                      fontFamily: 'SourceSansPro',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    this.property,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black54,
                        fontFamily: 'SourceSansPro',
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.5
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
