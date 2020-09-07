import 'package:flutter/material.dart';
import 'package:movie_box/components/my_app_bar.dart';

class WatchList extends StatefulWidget {
  @override
  _WatchListState createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          MyAppBar(),
          SizedBox(height: 16.0,),
          Text(
            'Watch List',
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
