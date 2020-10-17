import 'package:flutter/material.dart';
import 'package:movie_box/components/my_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:movie_box/models/logged_in_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WatchList extends StatefulWidget {
  @override
  _WatchListState createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  User _user;

  @override
  Widget build(BuildContext context) {
    _user = Provider.of<LoggedInUser>(context, listen: false).getUser;

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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Text(
                        "Hey, ${_user.displayName}!",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "No worries.. We've got you covered!!",
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                ),
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
