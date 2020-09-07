import 'package:flutter/material.dart';
import 'package:movie_box/components/my_app_bar.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          MyAppBar(),
          SizedBox(
            height: 16.0,
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth <= 750.0) {
                return CustomScrollView(
                  primary: false,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  slivers: <Widget>[SliverPadding(
                    padding: EdgeInsets.all(0.0),
                    sliver: SliverGrid.count(
                      childAspectRatio: 100/130,
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      children: List.generate(30, (index) {
                        return Container(
//                      height: MediaQuery.of(context).size.height / 3,
//                      width: MediaQuery.of(context).size.width / 3 - 4.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.deepPurple[900],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Center(child: Text('$index')),
                        );
                      }),
                    ),
                  ),]
                );
              } else {
                return SliverGrid.count(crossAxisCount: 5);
              }
            },
          ),
        ],
      ),
    );
  }
}
