import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:movie_box/components/cast_pic_card.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

bool showMore = false;

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: showMore ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn.shopify.com/s/files/1/0969/9128/products/Joker_-_Put_On_A_Happy_Face_-_Joaquin_Phoenix_-_Hollywood_English_Movie_Poster_3_6cb8f765-be3f-4cb8-bb4e-ead8c435e42e.jpg?v=1579504964',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(0.0, -0.25),
                        end: const Alignment(0.0, -1),
                        colors: <Color>[
                          Colors.white.withOpacity(1),
                          Colors.white.withOpacity(0),
                        ],
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Joker',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black87,
                              fontFamily: 'SourceSansPro',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '2019',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.grey.withOpacity(0.9),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 8.0,
                                ),
                              ),
                              Text(
                                'Warner Brothers',
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.grey.withOpacity(0.9),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 16.0),
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 16.0),
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 16.0),
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 16.0),
                                Icon(Icons.star_half,
                                    color: Colors.yellow, size: 16.0),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.play_circle_filled,
                            color: Colors.orangeAccent,
                            size: 32.0,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Card(
                              elevation: 0.0,
                              child: Text(
                                'The Joker is a master criminal with a clown-like appearance, and is considered one of the most infamous criminals within Gotham City. Initially portrayed as a violent sociopath who murders people for his own amusement, the Joker later in the 1940s began to be written as a goofy trickster-thief.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black26,
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 12.0,
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          showMore
              ? Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Cast',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black54,
                          fontFamily: 'SurceSansPro',
                          letterSpacing: 1.7,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            CastPicCard(
                              name: 'Brad Pitt',
                              imageUri:
                                  'https://m.media-amazon.com/images/M/MV5BOTVmYjRkNzctMzk1MC00MGQ3LTg1ZmYtYmE2MTNhYzhlY2JhXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_.jpg',
                            ),
                            CastPicCard(
                              name: 'Brad Pitt',
                              imageUri:
                                  'https://m.media-amazon.com/images/M/MV5BOTVmYjRkNzctMzk1MC00MGQ3LTg1ZmYtYmE2MTNhYzhlY2JhXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_.jpg',
                            ),
                            CastPicCard(
                              name: 'Brad Pitt',
                              imageUri:
                                  'https://m.media-amazon.com/images/M/MV5BOTVmYjRkNzctMzk1MC00MGQ3LTg1ZmYtYmE2MTNhYzhlY2JhXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_.jpg',
                            ),
                            CastPicCard(
                              name: 'Brad Pitt',
                              imageUri:
                                  'https://m.media-amazon.com/images/M/MV5BOTVmYjRkNzctMzk1MC00MGQ3LTg1ZmYtYmE2MTNhYzhlY2JhXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_.jpg',
                            ),
                            CastPicCard(
                              name: 'Brad Pitt',
                              imageUri:
                                  'https://m.media-amazon.com/images/M/MV5BOTVmYjRkNzctMzk1MC00MGQ3LTg1ZmYtYmE2MTNhYzhlY2JhXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_.jpg',
                            ),
                            CastPicCard(
                              name: 'Brad Pitt',
                              imageUri:
                                  'https://m.media-amazon.com/images/M/MV5BOTVmYjRkNzctMzk1MC00MGQ3LTg1ZmYtYmE2MTNhYzhlY2JhXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_.jpg',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : GestureDetector(
            onTap: () {
              setState(() {
                showMore = true;
              });
            },
                  child: Icon(Icons.keyboard_arrow_down,
                      size: 24.0, color: Colors.grey))
        ],
      ),
    );
  }
}
