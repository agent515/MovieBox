import 'package:flutter/material.dart';
import 'package:movie_box/models/logged_in_user.dart';
import 'package:provider/provider.dart';
import 'package:movie_box/screens/watch_list.dart';
import 'package:movie_box/screens/sign_in.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<LoggedInUser>(context,).isLoggedIn ? WatchList() : SignInPage();
  }
}
