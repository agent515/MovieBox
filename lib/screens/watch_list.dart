import 'package:flutter/material.dart';
import 'package:movie_box/components/my_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:movie_box/models/logged_in_user.dart';

class WatchList extends StatefulWidget {
  @override
  _WatchListState createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          MyAppBar(icon: Icons.person_outline, callback: () {Provider.of<LoggedInUser>(context, listen: false).signOut();},),
          SizedBox(height: 16.0,),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
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
          ),
        ],
      ),
    );
  }
}
