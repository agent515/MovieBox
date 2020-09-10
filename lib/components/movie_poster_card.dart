import 'package:flutter/material.dart';

class MoviePosterCard extends StatelessWidget {
  MoviePosterCard({@required this.name, @required this.imageUri});

  final String name;
  final String imageUri;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
        ),
        width: 120,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(this.imageUri),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6.0), bottomRight: Radius.circular(6.0)),
                    gradient: LinearGradient(
                        begin: Alignment(0.0, 0.7),
                        end: Alignment(0.0, -1.0),
                        colors: <Color>[
                          Colors.black54.withOpacity(0.9),
                          Colors.black54.withOpacity(0.0)
                        ]
                    )
                ),
                height: 80,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(this.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'SourceSansPro',
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}