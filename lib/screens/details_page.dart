import 'package:flutter/material.dart';
import 'package:movie_box/components/cast_pic_card.dart';
import 'package:movie_box/components/custom_card.dart';
import 'package:movie_box/components/heading3.dart';
import 'package:movie_box/components/movie_poster_card.dart';
import 'package:movie_box/components/review.dart';
import 'package:movie_box/constants/styles.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:like_button/like_button.dart';
import 'package:movie_box/helper.dart';
import 'package:movie_box/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({this.data});
  final Map<dynamic, dynamic> data;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool showMore = false;
  bool longName = true;
  bool tapped = false;
  bool isLiked = false;
  bool addedToWatchlist = false;
  Map<dynamic, dynamic> data;
  Map<dynamic, dynamic> castCrewData = null;

  @override
  void initState() {
    data = widget.data;
    print("data: $data");
    print("length: ${data["genres"].length}");
    print("${data["genres"]} ");
    if (data['title'].length > 20 && data['title'].split(' ').length >= 3) {
      longName = true;
    } else {
      longName = false;
    }
    super.initState();
  }

  Widget _getMovieTitle() {
    String title = data["title"];
    List<String> words = title.split(' ');
    int wordCount = title.split(' ').length;
    String firstPart = "";
    String secondPart = "";

    if (title.length > 20 && wordCount >= 3) {
      setState(() {
        longName = true;
      });
      for (int i = 0; i <= wordCount ~/ 2; i++) {
        firstPart += " " + words[i];
      }
      for (int i = wordCount ~/ 2 + 1; i < wordCount; i++) {
        secondPart += " " + words[i];
      }
    } else {
      setState(() {
        longName = false;
      });
      for (int i = 0; i < wordCount; i++) {
        firstPart += " " + words[i];
      }
    }
    print(longName);
    print(firstPart);
    print(secondPart);

    return Flex(direction: Axis.vertical, children: <Widget>[
      Text(
        firstPart,
        maxLines: 1,
        style: kDetailsTitleTextStyle,
        textAlign: TextAlign.center,
      ),
      longName
          ? Text(
              secondPart,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: kDetailsTitleTextStyle,
            )
          : Container(
              height: 0,
            ),
    ]);
  }

  Widget _getStars() {
    List<Widget> stars = [];
    double rating = data["vote_average"];
    int fullStars = rating ~/ 2;
    var temp = rating - ((rating ~/ 2) * 2);
    int halfStars = 0;
    if (temp >= 1.5) {
      fullStars += 1;
    } else if (temp >= 0.5) {
      halfStars = 1;
    }
    int zeroStars = 5 - fullStars - halfStars;

    for (int i = 1; i <= fullStars; i++) {
      stars.add(Icon(Icons.star, color: Colors.yellow, size: 16.0));
    }

    for (int i = 1; i <= halfStars; i++) {
      stars.add(Icon(Icons.star_half, color: Colors.yellow, size: 16.0));
    }

    for (int i = 1; i <= zeroStars; i++) {
      stars.add(Icon(Icons.star_border, color: Colors.yellow, size: 16.0));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }

  Future<List<Widget>> _getCastCrew(String entity) async {
    if (castCrewData == null) {
      var result = await Api.getCastCrew(data["id"]);
      castCrewData = result;
    }
    List<Widget> entityList = [];
    if (entity == "Cast") {
      for (int i = 0; i < castCrewData["cast"].length; i++) {
        Widget card = CastPicCard(
          name: castCrewData["cast"][i]["name"],
          role: castCrewData["cast"][i]["character"],
          imageUri: (castCrewData["cast"][i]["profile_path"] == null)
              ? ""
              : "https://image.tmdb.org/t/p/w300${castCrewData["cast"][i]["profile_path"]}",
        );
        entityList.add(card);
      }
    } else if (entity == "Crew") {
      for (int i = 0; i < castCrewData["crew"].length; i++) {
        Widget card = CastPicCard(
          name: castCrewData["crew"][i]["name"],
          role: castCrewData["crew"][i]["job"],
          imageUri: (castCrewData["crew"][i]["profile_path"] == null)
              ? ""
              : "https://image.tmdb.org/t/p/w300${castCrewData["crew"][i]["profile_path"]}",
        );
        entityList.add(card);
      }
    }
    return entityList;
  }

  Future<List<Widget>> _getSeeAlso() async {
    print("in see also");
    var result = await Api.getSimilarMovies(data["id"], 1);
    Map<dynamic, dynamic> similarMovies = result;
    print(similarMovies["results"]);
    List<Widget> entityList = [];
    for (int i = 0; i < similarMovies.length; i++) {
      print(similarMovies['results'][i]["title"]);
      print(
          "https://image.tmdb.org/t/p/w300${similarMovies['results'][i]['poster_path']}");
      Widget entity = MoviePosterCard(
        id: similarMovies['results'][i]['id'],
        name: similarMovies['results'][i]["title"],
        imageUri:
            "https://image.tmdb.org/t/p/w300${similarMovies['results'][i]['poster_path']}",
      );

      entityList.add(entity);
    }
    return entityList;
  }

  List<Widget> _getNumbers() {
    List<Widget> cards = [];
    Widget card;
    if (data.containsKey("release_date")) {
      var date = Helper.dateIntToChar(data["release_date"]);
      card = CustomCard(
        property: "Release Date",
        value: "${date["day"]} ${date["month"]}\n${date["year"]}",
      );
      cards.add(card);
    }
    if (data.containsKey("runtime")) {
      var result = Helper.runtimeIntToChar(data["runtime"]);
      card = CustomCard(
        property: "Runtime",
        value: "${result['hours']}H ${result['minutes']}M",
      );
      cards.add(card);
    }
    if (data.containsKey("vote_average")) {
      Widget card = CustomCard(
        property: "Rating",
        value: data["vote_average"].toString(),
      );
      cards.add(card);
    }
    if (data.containsKey("revenue")) {
      var revenue = Helper.revenueIntToChar(data["revenue"]);
      print(revenue);
      Widget card = CustomCard(
        property: "Revenue",
        value: "\$${revenue["amount"]} ${revenue["scale"]}",
      );
      cards.add(card);
    }
    if (data.containsKey("original_language")) {
      Widget card = CustomCard(
        property: "Language",
        value: "en",
      );
      cards.add(card);
    }
    return cards;
  }

  Future<List<Widget>> _getReviews() async {
    List<Widget> entityList = [];
    var result = await Api.getReviews(data['id']);
    Map<dynamic, dynamic> reviews = result;
    for (int i = 0; i < reviews['results'].length; i++) {
      Widget entity = Review(
        author: reviews['results'][i]['author'],
        comment: reviews['results'][i]['content'],
      );
      entityList.add(entity);
    }
    return entityList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: showMore ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanUpdate: (dragDownDetails) {
              setState(() {
                tapped = false;
                showMore = true;
              });
            },
            onLongPress: () {
              setState(() {
                tapped = !tapped;
              });
            },
            onTap: null,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height - 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
//                          'https://cdn.shopify.com/s/files/1/0969/9128/products/Joker_-_Put_On_A_Happy_Face_-_Joaquin_Phoenix_-_Hollywood_English_Movie_Poster_3_6cb8f765-be3f-4cb8-bb4e-ead8c435e42e.jpg?v=1579504964',
                          "https://image.tmdb.org/t/p/w500${data["poster_path"]}",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // TODO: Add Like Button to add movie to Liked Movie List
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
                            child: _getMovieTitle(),
                          ),
                          Expanded(
                              flex: longName ? 2 : 2,
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        data["release_date"]
                                            .toString()
                                            .substring(0, 4),
                                        style: kDetailsSubtitleTextStyle,
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
                                          data["production_companies"].length >
                                                  0
                                              ? data["production_companies"][0]
                                                  ["name"]
                                              : "Not Known",
                                          maxLines: 1,
                                          style: kDetailsSubtitleTextStyle)
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                          data["genres"].length,
                                          (index) => Text(
                                                "${data["genres"][index]["name"].toString()}  ",
                                                style: kDetailsGenreTextStyle,
                                              )))
                                ],
                              )),
                          Expanded(
                            flex: longName ? 2 : 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: _getStars(),
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
                                ClipOval(
                                  child: Material(
                                    elevation: 2.0,
                                    child: InkWell(
                                      splashColor: Colors.deepOrange,
                                      onTap: () async {
                                        String url = await Api.getVideoLink(
                                            data["imdb_id"].toString());
                                        if (url == "") {
                                          if (data.containsKey("imdb_id")) {
                                            url =
                                                "https://www.youtube.com/results?search_query=${data["title"]}";
                                          }
                                        }
                                        print(url);
//                                        String url =
//                                            "https://www.imdb.com/videoplayer/vi1723318041";
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: Icon(
                                        Icons.play_circle_filled,
                                        color: Colors.orangeAccent,
                                        size: 42.0,
                                      ),
                                    ),
                                  ),
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
//                                'The Joker is a master criminal with a clown-like appearance, and is considered one of the most infamous criminals within Gotham City. Initially portrayed as a violent sociopath who murders people for his own amusement, the Joker later in the 1940s began to be written as a goofy trickster-thief. Initially portrayed as a violent sociopath who murders people for his own amusement, the Joker later in the 1940s began to be written as a goofy trickster-thief.',
                                data["overview"],
                                textAlign: TextAlign.justify,
                                maxLines: 7,
                                style: kDetailsDescriptionTextStyle,
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
                              onTap: () async {
                                setState(() {
                                  showMore = true;
                                });
                              },
                              child: Container(
                                height: 20,
                                child: IconShadowWidget(
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 24.0,
                                    color: Colors.deepPurple[900],
                                  ),
                                  shadowColor: Colors.black12.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                        ),
                  tapped
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment(0, 0),
                                end: Alignment(0, -1),
                                colors: <Color>[
                                  Colors.black12.withOpacity(0.2),
                                  Colors.black12.withOpacity(0.7)
                                ]),
                          ),
                          alignment: Alignment(0.0, -0.5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white.withOpacity(0),
                              child: InkWell(
                                splashColor: Colors.white,
                                onTap: () {
                                  // TODO: Add to Watchlist
                                  setState(() {
                                    addedToWatchlist = !addedToWatchlist;
                                  });
                                },
                                child: Container(
                                    height: 32.0,
                                    width: 200.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: addedToWatchlist
                                            ? Colors.black54.withOpacity(0)
                                            : Colors.white,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: addedToWatchlist
                                          ? Colors.white
                                          : Colors.black54.withOpacity(0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        addedToWatchlist
                                            ? 'Added'
                                            : 'Add to watchlist',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: addedToWatchlist
                                              ? Colors.black54.withOpacity(0.7)
                                              : Colors.white,
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          showMore
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Heading3(
                          title: 'Cast',
                        ),
                        FutureBuilder(
                          future: _getCastCrew("Cast"),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Container(
                                height: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: snapshot.data,
                                ),
                              );
                            } else {
                              return Container(
                                height: 200,
                              );
                            }
                          },
                        ),
                        Heading3(
                          title: 'Crew',
                        ),
                        FutureBuilder(
                          future: _getCastCrew("Crew"),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Container(
                                height: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: snapshot.data,
                                ),
                              );
                            } else {
                              return Container(
                                height: 200,
                              );
                            }
                          },
                        ),
                        Heading3(title: 'Numbers'),
                        Container(
                          height: 300,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return GridView.count(
                                  physics: NeverScrollableScrollPhysics(),
                                  crossAxisCount: 3,
                                  children: _getNumbers());
                            },
                          ),
                        ),
                        Heading3(title: 'See Also'),
                        FutureBuilder(
                            future: _getSeeAlso(),
                            builder: (context, snapshot) {
                              print("snapshot");
                              print(snapshot.data);
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.data == null) {
                                  return Container(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        'No Similar Movies Data available',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Container(
                                  height: 200.0,
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: snapshot.data),
                                );
                              } else {
                                return Container(
                                  height: 160.0,
                                );
                              }
                            }),
                        Heading3(title: 'Reviews'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FutureBuilder(
                              future: _getReviews(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.data != null) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: snapshot.data,
                                  );
                                } else {
                                  return Container(
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        'No reviews available',
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontFamily: 'SourceSansPro',
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }),
                        )
                      ],
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
