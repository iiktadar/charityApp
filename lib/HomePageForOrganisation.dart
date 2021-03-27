// THIS IS THE HOME PAGE WITH ALERTS FROM CHARITIES. THE ALERT BOARD WITH POST BUTTON IS FOR ORGANISATIONS ONLY!!

import 'package:flutter/material.dart';

import './Education.dart';
import './Food.dart';
import './Community.dart';
import './Environment.dart';
import './AnimalServices.dart';
import './ProfilePage.dart';
import './PostPage.dart';

class OrganisationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Styling the top app bar with added icons
        appBar: AppBar(
          title: Text(
            'Alert Board',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Colors.indigo[100],
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.account_circle_outlined, color: Colors.white),
            ),
          ],
        ),
// ADDING POST BUTTON, CHANGE THE COLOUR!!!
        body: Container(),
        floatingActionButton: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreatePost()));
                      },
                      child: Icon(Icons.add))
                ])),
        // this is the code for the side navigation bar, with list of options. Navigator connects all pages
        drawer: Drawer(
            elevation: 1.5,
            child: Column(
              children: <Widget>[
                DrawerHeader(
                    decoration: BoxDecoration(
                  color: Colors.indigo[100],
                )),
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      // HOME PAGE- CAN INCLUDE ALERT BOARD TOO
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text("HOME"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OrganisationHomePage()));
                        },
                      ),

                      //FOOD BANK SERVICES BUTTON
                      ListTile(
                        leading: Icon(Icons.food_bank_rounded),
                        title: Text("Food Banks"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Food()));
                        },
                      ),
                      //COMMUNITY SERVICE BUTTON
                      ListTile(
                        leading: Icon(Icons.apartment_rounded),
                        title: Text("Community"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Community()));
                        },
                      ),

                      // ANIMAL SERVICES BUTTON
                      ListTile(
                        leading: Icon(Icons.pets),
                        title: Text("Animal Services"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnimalServices()));
                        },
                      ),
                      //EDUCATIONAL SERVICES BUTTON
                      ListTile(
                        leading: Icon(Icons.school_outlined),
                        title: Text("Education"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Education()));
                        },
                      ),
                      // ENVIRONMENTAL SERVICES BUTTON
                      ListTile(
                        leading: Icon(Icons.landscape_rounded),
                        title: Text("Environmental Services"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Environment()));
                        },
                      ),
                    ],
                  ),
                ),

                //container contains two options at bottom of drawer
                Container(
                    child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: Container(
                          child: Column(children: <Widget>[
                            Divider(),
                            ListTile(
                                leading: Icon(Icons.settings),
                                title: Text('Settings')),
                            ListTile(
                                leading: Icon(Icons.help), title: Text('Help')),
                            ListTile(
                                leading: Icon(Icons.logout),
                                title: Text('Logout')),
                          ]),
                        )))
              ],
            )),
      ),
    );
  }
}