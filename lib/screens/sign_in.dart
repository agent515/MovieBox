import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_box/services/authServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    AuthServices auth = AuthServices();
    User user;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.5),
            radius: 75.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage('images/logo/moviebox_logo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                user = await auth.signIn();
                if (user == null) {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Sign in failed',),),);
                }
                else {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Signed in',),),);

                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 64.0,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Continue with Google',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'SourceSansPro',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'SourceSansPro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Image.asset('images/logo/google_logo.png', height: 30,),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
