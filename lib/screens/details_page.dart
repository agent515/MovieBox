import 'package:flutter/material.dart';
import 'package:movie_box/components/cast_pic_card.dart';
import 'package:icon_shadow/icon_shadow.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

bool showMore = false;
bool longName = true;
bool tapped = false;

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: showMore ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        children: <Widget>[
          GestureDetector(
            onPanUpdate: (panUpdateDetails) {
              setState(() {
                showMore = true;
                tapped = false;
              });
            },
            onPanDown: (dragDownDetails){
              setState(() {
                tapped = false;
              });
            },
            onLongPress: (){
              setState(() {
                tapped = !tapped;
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height - 100,
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
                      height: MediaQuery.of(context).size.height / 2 + 100,
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
                            flex: longName ? 6 : 4,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 5,
                            ),
                          ),
                          Expanded(
                            flex: longName ? 5 : 2,
                            child: Flex(
                                direction: Axis.vertical,
                                children: <Widget>[
                                  Text(
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
                                  longName
                                      ? Text(
                                          'Joker',
                                          style: TextStyle(
                                            decoration: TextDecoration.none,
                                            color: Colors.black87,
                                            fontFamily: 'SourceSansPro',
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1.5,
                                          ),
                                        )
                                      : Container(
                                          height: 0,
                                        ),
                                ]),
                          ),
                          Expanded(
                            flex: longName ? 2 : 1,
                            child: Column(
                              children: <Widget>[
                                Row(
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Crime ',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.pinkAccent ,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Text(
                                      'Thriller ',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.pinkAccent,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Text(
                                      'Tragedy ',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.pinkAccent,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'SourceSansPro',
                                        fontSize: 14.0,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: longName ? 2 : 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
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
                            flex: longName ? 4 : 2,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Watch Trailer',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontFamily: 'SourceSansPro',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle_filled,
                                  color: Colors.orangeAccent,
                                  size: 42.0,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: longName ? 8 : 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4.0),
                              child: Text(
                                'The Joker is a master criminal with a clown-like appearance, and is considered one of the most infamous criminals within Gotham City. Initially portrayed as a violent sociopath who murders people for his own amusement, the Joker later in the 1940s began to be written as a goofy trickster-thief. Initially portrayed as a violent sociopath who murders people for his own amusement, the Joker later in the 1940s began to be written as a goofy trickster-thief.',
                                textAlign: TextAlign.justify,
                                maxLines: 7,
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black26,
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 12.0,
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  showMore
                      ? Container()
                      : Positioned(
                          left: (MediaQuery.of(context).size.width - 26) / 2,
                          bottom: MediaQuery.of(context).size.height * 0.04,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showMore = true;
                                });
                              },
                              child: Container(
                                height: 20,
                                child: IconShadowWidget(
                                  Icon(Icons.keyboard_arrow_down,
                                      size: 24.0, color: Colors.deepPurple[900],),
                                  shadowColor: Colors.black12.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                  tapped ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0, 0),
                        end: Alignment(0, -1),
                        colors: <Color>[
                          Colors.black12.withOpacity(0.2),
                          Colors.black12.withOpacity(0.7)
                        ]
                      ),
                    ),
                    alignment: Alignment(0.0, -0.5),
                    child: Container(
                      height: 32.0,
                        width: 200.0,
                        decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          'Add to watchlist',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontFamily: 'SourceSansPro',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.0,
                          ),
                        ),
                      )
                    ),
                  ) : Container(),
                ],
              ),
            ),
          ),
          showMore
              ? Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'See Also',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black54,
                            fontFamily: 'SurceSansPro',
                            letterSpacing: 1.7,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            CastPicCard(
                              name: 'Dark Knight',
                              imageUri:
                              'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                            ),
                            CastPicCard(
                              name: 'Dark Knight',
                              imageUri:
                              'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                            ),
                            CastPicCard(
                              name: 'Dark Knight',
                              imageUri:
                              'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                            ),
                            CastPicCard(
                              name: 'Dark Knight',
                              imageUri:
                              'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                            ),
                            CastPicCard(
                              name: 'Dark Knight',
                              imageUri:
                              'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                            ),
                            CastPicCard(
                              name: 'Dark Knight',
                              imageUri:
                              'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
