import 'package:flutter/material.dart';
import 'package:movie_box/components/my_app_bar.dart';
import 'package:movie_box/components/category_box.dart';
import 'package:movie_box/screens/details_page.dart';

enum category { Trending, TopRated }

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  category currentCategory = category.Trending;

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
                      currentCategory = category.Trending;
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
                      currentCategory = category.TopRated;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView(
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
                                childAspectRatio: 100 / 130,
                                crossAxisCount: 3,
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                                children: List.generate(30, (index) {
                                  return GestureDetector(
                                    onTap: (){
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.deepPurple[900],
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12.0),
                                          child: Image.network(
                                            'https://cdn.shopify.com/s/files/1/0969/9128/products/Joker_-_Put_On_A_Happy_Face_-_Joaquin_Phoenix_-_Hollywood_English_Movie_Poster_3_6cb8f765-be3f-4cb8-bb4e-ead8c435e42e.jpg?v=1579504964',
                                            fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                  );
                                }),
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
                                children: List.generate(30, (index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.deepPurple[900],
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Center(child: Text('$index')),
                                  );
                                }),
                              ),
                            ),
                          ]);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
