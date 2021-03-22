import 'package:flutter/material.dart';
import './Education.dart';
import './HomePage.dart';
import './Food.dart';
import './Community.dart';
import './Environment.dart';
import './AnimalServices.dart';

//THIS IS THE USER PROFILE PAGE, MUST BE CONNECTED TO PROFILE ICON ON MAIN PAGE

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                //back button to go back to home page
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                centerTitle: true,
                title: Text(
                  'Profile Page',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                // NEED TO CHANGE THE NAVIGATOR TO STARTING PAGE OF APP when users logout of account, at the moment it is set to home page.
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                ]),
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.indigo[100],
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 90),
                      )),
                ),
                //profile picture avatar here
                ListView(
                  children: [
                    const SizedBox(height: 50),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                    ),
                    const SizedBox(height: 7),
                    Text("First Name, Surname", textAlign: TextAlign.center),
                  ],
                ),
                //Different boxes where information provided from the sign-up form should go
                Column(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10,
                        350,
                        10,
                        10,
                      ),
                      child: Container(
                        height: 100,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text('Bio'),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1.0, color: Colors.grey)),
                      )),
                ]),
                Column(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10,
                        470,
                        10,
                        10,
                      ),
                      child: Container(
                        height: 50,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text('Name'),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1.0, color: Colors.grey)),
                      )),
                ]),
                Column(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10,
                        535,
                        10,
                        10,
                      ),
                      child: Container(
                        height: 50,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text('Email'),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1.0, color: Colors.grey)),
                      )),
                ]),
                Column(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10,
                        600,
                        10,
                        10,
                      ),
                      child: Container(
                        height: 50,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text('Interests'),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1.0, color: Colors.grey)),
                      )),
                ]),

                //Not neccessary at this point but users could be allowed to 'save' job posts that they wish to complete
                Column(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10,
                        670,
                        10,
                        10,
                      ),
                      child: Container(
                        height: 50,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(' Saved jobs'),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(width: 1.0, color: Colors.grey)),
                      )),
                ])
              ],
            )));
  }
}