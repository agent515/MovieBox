import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_box/components/movie_card.dart';
import 'package:movie_box/components/my_app_bar.dart';
import 'package:movie_box/screens/details_page.dart';
import 'package:movie_box/services/api.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Map<dynamic, dynamic> searchResults;
  List<dynamic> showList = [];
  bool updated = false;
  List<Widget> _searchedCards = [];
  List<dynamic> recentList = [
    {
      "popularity": 0.6,
      "id": 556726,
      "video": false,
      "vote_count": 0,
      "vote_average": 0,
      "title": "Le joker",
      "release_date": "1930-11-14",
      "original_language": "fr",
      "original_title": "Le joker",
      "genre_ids": [],
      "backdrop_path": null,
      "adult": false,
      "overview": "",
      "poster_path": "/6HaRo7pdCEOkl0r4WGBhZUtQBUr.jpg"
    },
    {
      "popularity": 1.4,
      "id": 533864,
      "video": false,
      "vote_count": 0,
      "vote_average": 0,
      "title": "Untitled Jared Leto / Joker Film",
      "release_date": "",
      "original_language": "en",
      "original_title": "Untitled Jared Leto / Joker Film",
      "genre_ids": [80, 28],
      "backdrop_path": null,
      "adult": false,
      "overview":
      "Stand-alone project centering on The Joker from the 2016 film 'Suicide Squad'.",
      "poster_path": null
    },
    {
      "popularity": 0.705,
      "vote_count": 3,
      "video": false,
      "poster_path": null,
      "id": 407788,
      "adult": false,
      "backdrop_path": null,
      "original_language": "en",
      "original_title": "King, Queen and Joker",
      "genre_ids": [],
      "title": "King, Queen and Joker",
      "vote_average": 5.3,
      "overview":
      "King, Queen, Joker is a 1921 silent feature farce written and directed by Sydney Chaplin, Charlie's older brother. The picture was produced by Famous Players-Lasky and distributed through Paramount Pictures. The film was shot in England, France and the United States.\r Less than a reel of this film, the barbershop sequence, survives at the British Film Institute. It was included in the 2011 Criterion DVD special two disc edition release of The Great Dictator.",
      "release_date": "1921-05-15"
    },
    {
      "popularity": 0.6,
      "vote_count": 0,
      "video": false,
      "poster_path": null,
      "id": 373797,
      "adult": false,
      "backdrop_path": null,
      "original_language": "ml",
      "original_title": "Mera Naam Joker",
      "genre_ids": [35],
      "title": "Mera Naam Joker",
      "vote_average": 0,
      "overview":
          "The story of four friends who decide to start a Auto Mechanic story.",
      "release_date": "2000-08-16"
    },
  ];
  int pageNo = 1;
  bool canUpdate = false;

  TextEditingController searchTextController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  Timer debounce;

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        pageNo += 1;
        updated = true;
        updateAndGetList();
      });
      print("update");
    }
  }

  @override
  void initState() {
    searchTextController.addListener(_onSearchChanged);
    _scrollController.addListener(_scrollListener);
    super.initState();
    updateAndGetList();
  }

  @override
  void dispose() {
    searchTextController.removeListener(_onSearchChanged);
    searchTextController.dispose();
    debounce.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    if (debounce?.isActive ?? false) debounce.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () async {
      showList = [];
      updateAndGetList();
    });
  }

  // void refreshList() {
  //   setState(() {
  //     updateAndGetList();
  //   });
  // }

  void updateAndGetList() async {
    String query = searchTextController.text;
    List<Widget> cards = [];

    if (searchTextController.text == "") {
      setState(() {
        showList = recentList;
      });
    } else {
      var result = await Api.search(query, 'movie', pageNo: pageNo);

      searchResults = result;

      print(searchResults['results']);

      //Check whether there are more results, not
      if (searchResults['results'].length == 0) {
        if (mounted) {
          setState(() {
            print('inside if mounted set state');
            canUpdate = false;
          });
        }
      } else {
        print('inside else');
        if (mounted) {
          setState(() {
            print('inside else mounted set state');
            canUpdate = true;
          });
        }
      }

      showList = searchResults['results'];
      // if (updated) {
      //       //   setState(() {
      //       //     showList.addAll(searchResults['results']);
      //       //     updated = true;
      //       //   });
      //       // } else {
      //       //   setState(() {
      //       //     showList = searchResults['results'];
      //       //   });
      //       // }

      if (updated) {
        cards = _searchedCards;
      } else {
        cards = [];
      }
    }

    for (int i = 0; i < showList.length; i++) {
      print(i);
      try {
        Widget card = MovieCard(
          show: showList[i],
          onTap: () async {
            var details = await Api.getDetails(showList[i]['id'], 'movie');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsPage(
                      data: details,
                    ),
              ),
            );
          },
        );
        cards.add(card);
      } catch (e) {
        print(e.message);
      }
    }

    print("in searchresult");

    if (mounted) {
      setState(() {
        _searchedCards = cards;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          MyAppBar(),
          SizedBox(
            height: 16.0,
          ),
          Container(
            height: 52.0,
            child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    key: Key('searchField'),
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black38,
                      ),
                    ),
                    onChanged: (String query) {},
                    onEditingComplete: () {
                      print(searchTextController.text);
                      FocusManager.instance.primaryFocus.unfocus();
                    },
                    enableSuggestions: true,
                    autofocus: true,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black54,
                        fontFamily: 'SourceSansPro',
                        fontSize: 16.0,
                        letterSpacing: 0.5),
                    textAlign: TextAlign.center,
                    controller: searchTextController,
                  ),
                )),
          ),
          SizedBox(
            height: 16.0,
          ),
          _searchedCards.length != 0
              ? Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth <= 750.0) {
                    return GridView.builder(
                      controller: _scrollController,
                      itemCount: _searchedCards.length + 1,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 100 / 220,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemBuilder: (context, index) {
                        // print(index);
                        if (index == _searchedCards.length) {
                          if (canUpdate) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Container();
                          }
                        } else {
                          return _searchedCards[index];
                        }
                      },
                    );
                  } else {
                    return GridView.builder(
                      controller: _scrollController,
                      itemCount: _searchedCards.length + 1,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 100 / 130,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemBuilder: (context, index) {
                        if (index == _searchedCards.length) {
                          if (canUpdate) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Container();
                          }
                        } else {
                          return _searchedCards[index];
                        }
                      },
                    );
                  }
                },
              ),
            ),
          )
              : Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.65,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

class NaNMessgae extends StatelessWidget {
  const NaNMessgae({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No results found',
        key: Key('noResults'),
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: 'SourceSansPro',
          fontSize: 16,
        ),
      ),
    );
  }
}

// FutureBuilder(
// future: _listFuture,
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.done) {
// if (snapshot.data == null || snapshot.data.length == 0) {
// print("in");
// return Expanded(
// child: NaNMessgae(
// key: Key('noResults'),
// ),
// );
// }
//
// return Expanded(
// child: ListView(
// key: Key('searchResult'),
// controller: _scrollController,
// padding: EdgeInsets.only(top: 0.0),
// scrollDirection: Axis.vertical,
// children: <Widget>[
// LayoutBuilder(
// builder: (context, constraints) {
// if (constraints.maxWidth <= 750.0) {
// return CustomScrollView(
// primary: false,
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// slivers: <Widget>[
// SliverPadding(
// padding: EdgeInsets.all(0.0),
// sliver: SliverGrid.count(
// childAspectRatio: 100 / 220,
// crossAxisCount: 3,
// mainAxisSpacing: 8.0,
// crossAxisSpacing: 8.0,
// children: snapshot.data,
// ),
// ),
// ]);
// } else {
// return CustomScrollView(
// primary: false,
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// slivers: <Widget>[
// SliverPadding(
// padding: EdgeInsets.all(0.0),
// sliver: SliverGrid.count(
// childAspectRatio: 100 / 130,
// crossAxisCount: 5,
// mainAxisSpacing: 8.0,
// crossAxisSpacing: 8.0,
// children: snapshot.data,
// ),
// ),
// ]);
// }
// },
// ),
// ],
// ),
// );
// } else {
// return Container(
// height: MediaQuery.of(context).size.height * 0.65,
// child: Center(child: CircularProgressIndicator()));
// }
// }),

// Changes:
// - Added FadeInImage transitions while fetching image from network image.
// - Refactored and created a new widget: "MovieCard" and added the implementation to necessary pages.
// - Added placeholder image for movie with no posters.
// - Made the change to showList; no there are no reptitions in the list.
// - Search Page:
// 1. Fixed the scroll glitch
// 2. Keyboard loses focus after editing is complete.
// 3. The search now stops showing circular progess indicator if there is no new entries
// 4. Refactored and cleaned the code like the explore page.
