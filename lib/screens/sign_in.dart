import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(
            image: NetworkImage(
                'https://www.clipartmax.com/png/middle/206-2060136_movie-camera-clip-art-clipart-free-download-film-camera-clipart-transparent.png'),
            height: 150,
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                try {
                  GoogleSignInAccount user =  await _googleSignIn.signIn();
                  if (user == null) {
                    SnackBar(content: Text('Failed to Sign in'));
                  }
                  else {
                    print("success");
                  }
                } catch (error) {
                  print(error);
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 64.0,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
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
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'SourceSansPro',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Image.asset('images/logo/google_logo.png', height: 50.0,),
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
