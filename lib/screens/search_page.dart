import 'package:flutter/material.dart';
import 'package:movie_box/components/my_app_bar.dart';
import 'package:movie_box/screens/details_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextController = TextEditingController();

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
                    cursorColor: Colors.black38,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black38,
                      ),
                    ),
                    onEditingComplete: () {
                      print(searchTextController.text);
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
          SizedBox(height: 16.0,),
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
                                childAspectRatio: 100 / 170,
                                crossAxisCount: 3,
                                mainAxisSpacing: 8.0,
                                crossAxisSpacing: 8.0,
                                children: List.generate(5, (index) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
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
                                                borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
                                                child: Image.network(
                                                  'https://cdn.shopify.com/s/files/1/0969/9128/products/Joker_-_Put_On_A_Happy_Face_-_Joaquin_Phoenix_-_Hollywood_English_Movie_Poster_3_6cb8f765-be3f-4cb8-bb4e-ead8c435e42e.jpg?v=1579504964',
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
                                                  'Joker',
                                                  style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black87,
                                                    fontFamily: 'SourceSansPro',
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 0.7,
                                                  ),
                                                ),
                                                Text('2019', style: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.5,
                                                ),)
                                              ],
                                            ),
                                          )
                                        ],
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
