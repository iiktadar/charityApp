import 'package:flutter/material.dart';
import './Login_screen.dart';
import './SignUp.dart';


class WelcomePage extends StatelessWidget {
  @override
  List<Color> gradients = [Colors.deepOrange, Colors.yellow];
  Widget build(BuildContext context) {
    var gradients;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Your Charity App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Have an account?',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30),
            ),
            Text(' '),
            Text(' '),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              textColor: Colors.white,
              color: Colors.purple,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login_screen()),
                );
              },
            ),
            Text(' '),
            Text(
              'Become a member',
              style: TextStyle(fontSize: 30),
            ),
            Text(' '),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              textColor: Colors.white,
              color: Colors.purple,
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
