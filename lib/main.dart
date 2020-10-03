import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:movie_box/constants/styles.dart';
import 'package:movie_box/screens/search_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/logged_in_user.dart';
import 'screens/auth_page.dart';
import 'screens/explore_page.dart';
import 'screens/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  String userId = pref.getString('user-id') ?? null;
  print("Userid: $userId");
  runApp(ChangeNotifierProvider(
    create: (context) => LoggedInUser(userId),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SourceSansPro',
        primaryColor: Colors.white,
        accentColor: Colors.deepPurple,
      ),
      home: WelcomePage(),
    ),
  ));
}

class MovieBox extends StatefulWidget {
  @override
  _MovieBoxState createState() => _MovieBoxState();
}

class _MovieBoxState extends State<MovieBox> {
  int index = 0;
  List<Widget> screens = [
    ExplorePage(),
    SearchPage(),
    AuthPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setNavigationBarColor(Colors.white, animate: true);
    return Scaffold(
      //Added to remove renderflex overflow in search while autofocusing on the search field.
      resizeToAvoidBottomInset: false,
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        elevation: 0.0,
        unselectedLabelStyle:
            kBottomNavTextStyle.copyWith(color: Colors.black26),
        unselectedItemColor: Colors.black54,
        unselectedIconTheme: IconThemeData(size: 24.0),
        selectedItemColor: Colors.deepPurple[900],
        selectedLabelStyle: kBottomNavTextStyle,
        selectedIconTheme: IconThemeData(size: 32.0),
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
            ),
            title: Text(
              'Explore',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            title: Text(
              'WatchList',
            ),
          ),
        ],
      ),
    );
  }
}
