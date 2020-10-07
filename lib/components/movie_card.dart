import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    @required this.show,
    @required this.onTap,
  }) : super(key: key);

  final Map<String, dynamic> show;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  // color: Colors.deepPurple[900],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12)),
                  child:
                      show["poster_path"] != null && show["poster_path"] != ""
                          ? FadeInImage.assetNetwork(
                              placeholder:
                                  "images/placeholder/film-poster-placeholder.png",
                              image:
                                  "https://image.tmdb.org/t/p/w400${show["poster_path"]}",
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'images/placeholder/movie_poster.png',
                              fit: BoxFit.cover,
                            ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  //Centered the Text in the lower part of the card.
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      show["title"].toString(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                        fontFamily: 'SourceSansPro',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.7,
                      ),
                    ),
                    show["release_date"] != "" && show["release_date"] != null
                        ? Text(
                            show["release_date"].toString().substring(0, 4),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'SourceSansPro',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          )
                        : Container(
                            color: Colors.white,
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Image.network(
// //                    'https://cdn.shopify.com/s/files/1/0969/9128/products/Joker_-_Put_On_A_Happy_Face_-_Joaquin_Phoenix_-_Hollywood_English_Movie_Poster_3_6cb8f765-be3f-4cb8-bb4e-ead8c435e42e.jpg?v=1579504964',
// "https://image.tmdb.org/t/p/w400${show["poster_path"]}",
// fit: BoxFit.cover,
// )
