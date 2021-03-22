import 'package:flutter/material.dart';
import './Login_screen.dart';
import './SignUp.dart';
import './SignUp_Org.dart';
import './SignUp_volunteer.dart';

class SignUp extends StatelessWidget {
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
              'How are you joining us today?',
              style: TextStyle(fontSize: 30),
            ),
            Text(' '),
            Text(' '),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.purple,
              child: Text(
                'I am reprezenting an organization',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp_Org()),
                );
              },
            ),
            Text(' '),
            Text(' '),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.purple,
              child: Text(
                'I am a volunteer',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp_volunteer()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}