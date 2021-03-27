import 'package:first_app/HomePage.dart';
import 'package:first_app/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:first_app/oof.dart';
import 'package:first_app/SignUp_screen.dart';
import 'package:first_app/Service/auth.dart';

import 'HomePageForOrganisation.dart';

class Login_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Login_screen> {

  final AuthService auth = AuthService();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen '),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Good to see you back!',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  textColor: Colors.purple,
                  child: Text('Forgot Password'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => oof()),
                    );
                  },
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.purple,
                      child: Text('Login'),
                      onPressed: () async {
                        print(nameController.text);
                        print(passwordController.text);
                        dynamic result = await auth.signInEmailPassword(nameController.text,passwordController.text);
                        if (result == null){
                          print("Sign in failed");
                        }
                        else{
                          print("Signed in");
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OrganisationHomePage()),
                        );
                        }
                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Dont have account?'),
                    FlatButton(
                      textColor: Colors.purple,
                      child: Text(
                        'Sign Up ',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUp()),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
