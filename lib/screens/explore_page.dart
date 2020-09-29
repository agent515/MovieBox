import 'package:flutter/material.dart';
import 'package:movie_box/components/my_app_bar.dart';
import 'package:movie_box/components/category_box.dart';
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
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        pageNo += 1;
        print("update");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
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
    showList.addAll(data["results"]);
    return data;
  }

  Future<List<Widget>> _getCards(int pageNo) async {
    data = await _getData(pageNo);
    List<Widget> cards;
    print(previousCategory);
    print(currentCategory);
    if (_cards.length == 0 || previousCategory != currentCategory) {
      cards = [];
      print("in");
    }
    else {
      cards = _cards;
    }

    for (int i = 0; i < showList.length; i++) {
      Widget card = GestureDetector(
        onTap: () async {
          var details = await Api.getDetails(showList[i]['id'], 'movie');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        data: details,
                      )));
        },
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
                    color: Colors.deepPurple[900],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                    child: Image.network(
//                    'https://cdn.shopify.com/s/files/1/0969/9128/products/Joker_-_Put_On_A_Happy_Face_-_Joaquin_Phoenix_-_Hollywood_English_Movie_Poster_3_6cb8f765-be3f-4cb8-bb4e-ead8c435e42e.jpg?v=1579504964',
                      "https://image.tmdb.org/t/p/w400${showList[i]["poster_path"]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      showList[i]["title"].toString(),
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
                    Text(
                      showList[i]["release_date"]
                          .toString()
                          .substring(0, 4),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'SourceSansPro',
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      previousCategory = currentCategory;
      cards.add(card);
    }
    return cards;
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
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          FutureBuilder(
              future: _getCards(pageNo),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: ListView(
                      controller: _scrollController,
                      padding: EdgeInsets.only(top: 0.0),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth <= 750.0) {
                              return CustomScrollView(
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  slivers: <Widget>[
                                    SliverPadding(
                                      padding: EdgeInsets.all(0.0),
                                      sliver: SliverGrid.count(
                                        childAspectRatio: 100 / 220,
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 8.0,
                                        crossAxisSpacing: 8.0,
                                        children: snapshot.data,
                                      ),
                                    ),
                                  ]);
                            } else {
                              return CustomScrollView(
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  slivers: <Widget>[
                                    SliverPadding(
                                      padding: EdgeInsets.all(0.0),
                                      sliver: SliverGrid.count(
                                        childAspectRatio: 100 / 130,
                                        crossAxisCount: 5,
                                        mainAxisSpacing: 8.0,
                                        crossAxisSpacing: 8.0,
                                        children: snapshot.data,
                                      ),
                                    ),
                                  ]);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                      child: Center(child: CircularProgressIndicator())
                  );
                }
              }),
        ],
      ),
    );
  }
}
