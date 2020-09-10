import 'package:flutter/material.dart';

class CastPicCard extends StatelessWidget {
  CastPicCard({@required this.name, @required this.imageUri, @required this.role});

  final String name;
  final String imageUri;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Container(
        width: 120,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(120.0),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(this.imageUri),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                    this.name,
                    textAlign: TextAlign.center ,
                    maxLines: 2,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w500)),
                Text(
                  this.role,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.bold,
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}