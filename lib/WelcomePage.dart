import 'package:flutter/material.dart';
import 'package:first_app/Login_screen.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Your Charity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Have an account?',
              style: TextStyle(fontSize: 30),
            ),
            Text(' '),
            Text(' '),
            RaisedButton(
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
            )
          ],
        ),
      ),
    );
  }
}
