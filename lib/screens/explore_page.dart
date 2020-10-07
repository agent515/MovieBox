import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_box/components/category_box.dart';
import 'package:movie_box/components/movie_card.dart';
import 'package:movie_box/components/my_app_bar.dart';
import 'package:movie_box/screens/details_page.dart';
import 'package:movie_box/services/api.dart';

enum category { Trending, TopRated }

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  category currentCategory = category.Trending;
  category previousCategory = category.Trending;
  Map<dynamic, dynamic> data;
  List<dynamic> showList = [];
  int pageNo = 1;
  List<Widget> _cards = [];

  ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        pageNo += 1;
        print("update and page no is $pageNo");
        _getCards(pageNo);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _getCards(pageNo);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
  }

  Future<Map<dynamic, dynamic>> _getData(int pageNo) async {
    if (currentCategory == category.Trending) {
      data = await Api.getMovies(pageNo, 'popular');
    } else if (currentCategory == category.TopRated) {
      data = await Api.getMovies(pageNo, 'top_rated');
    }
    if (previousCategory != currentCategory) {
      showList = [];
    }
    showList = data["results"];
    return data;
  }

  void _getCards(int pageNo) async {
    data = await _getData(pageNo);
    List<Widget> cards;
    print(previousCategory);
    print(currentCategory);
    if (_cards.length == 0 || previousCategory != currentCategory) {
      cards = [];
      print("in");
    } else {
      cards = _cards;
    }

    for (int i = 0; i < showList.length; i++) {
      Widget card = MovieCard(
          show: showList[i],
          onTap: () async {
            var details = await Api.getDetails(showList[i]['id'], 'movie');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  data: details,
                ),
              ),
            );
          });
      previousCategory = currentCategory;
      cards.add(card);
    }

    //Check whether parent is in the widget tree or not, if not then don't use setState.
    if (mounted) {
      setState(() {
        _cards = cards;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
      child: Column(
        children: <Widget>[
          MyAppBar(),
          SizedBox(
            height: 16.0,
          ),
          Container(
            alignment: Alignment.topLeft,
            height: 32.0,
            child: ListView(
              key: PageStorageKey<String>('controllerA'),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CategoryBox(
                  boxColor: currentCategory == category.Trending
                      ? Colors.deepPurple[900]
                      : Colors.white,
                  textColor: currentCategory == category.Trending
                      ? Colors.white
                      : Colors.black54,
                  text: 'Trending',
                  onTapCallback: () {
                    setState(() {
                      previousCategory = currentCategory;
                      currentCategory = category.Trending;
                      pageNo = 1;
                      _cards = [];
                      _getCards(pageNo);
                    });
                  },
                ),
                CategoryBox(
                  boxColor: currentCategory == category.TopRated
                      ? Colors.deepPurple[900]
                      : Colors.white,
                  textColor: currentCategory == category.TopRated
                      ? Colors.white
                      : Colors.black54,
                  text: 'Top-rated',
                  onTapCallback: () {
                    setState(() {
                      previousCategory = currentCategory;
                      currentCategory = category.TopRated;
                      pageNo = 1;
                      _cards = [];
                      _getCards(pageNo);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          _cards.length != 0
              ? Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth <= 750.0) {
                          return GridView.builder(
                            controller: _scrollController,
                            itemCount: _cards.length + 1,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 100 / 220,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                            ),
                            itemBuilder: (context, index) {
                              if (index == _cards.length) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return _cards[index];
                              }
                            },
                          );
                        } else {
                          return GridView.builder(
                            controller: _scrollController,
                            itemCount: _cards.length + 1,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              childAspectRatio: 100 / 130,
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                            ),
                            itemBuilder: (context, index) {
                              if (index == _cards.length) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return _cards[index];
                              }
                            },
                          );
                        }
                      },
                    ),
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ],
      ),
    );
  }
}

// GridView.count(
// controller: _scrollController,
// primary: false,
// crossAxisCount: 5,
// childAspectRatio: 100 / 130,
// mainAxisSpacing: 8.0,
// crossAxisSpacing: 8.0,
// shrinkWrap: true,
// children: _cards,
// );

// GridView.count(
// controller: _scrollController,
// primary: false,
// crossAxisCount: 3,
// childAspectRatio: 100 / 220,
// mainAxisSpacing: 8.0,
// crossAxisSpacing: 8.0,
// shrinkWrap: true,
// children: _cards,
// );

// CustomScrollView(
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

//
// CustomScrollView(
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
// ])
