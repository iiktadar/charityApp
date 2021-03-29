// THIS IS THE HOME PAGE WITH ALERTS FROM CHARITIES. THE ALERT BOARD WITH POST BUTTON IS FOR ORGANISATIONS ONLY!!

import 'package:first_app/AlertBoard.dart';
import 'package:first_app/Service/post.dart';
import 'package:flutter/material.dart';

import './Education.dart';
import './Food.dart';
import './Community.dart';
import './Environment.dart';
import './AnimalServices.dart';
import './ProfilePage.dart';
import './PostPage.dart';
import './HomePageForOrganisation.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<Post> posts = [
    Post(
        date: "27/03/2021",
        description: "Looking for volunteers to help with sport events",
        location: "London",
        name: "British Heart Foundation",
        number: "0201234567",
        time: "12:00",
        logo: "bhf.png",
        address: "High Street, London, NW1"),
    Post(
        date: "01/04/2021",
        description: "I want to help beat Cancer!",
        location: "London",
        name: "Cancer Research UK",
        number: "0201234567",
        time: "11:00",
        logo: "cruk.png",
        address: "2 Redman Place, London, E20 1JQ"),
    Post(
        date: "27/03/2021",
        description: "Help people with disabilites",
        location: "Manchester",
        name: "Special Olympics",
        number: "0201234567",
        time: "14:00",
        logo: "specialolympics.png",
        address: "145 City Road, Hoxton, London, EC1V 1AZ"),
    Post(
        date: "27/03/2021",
        description:
            "Join us in our march to ask for better conditions for refugees",
        location: "Leeds",
        name: "UNICEF UK",
        number: "0201234567",
        time: "18:00",
        logo: "unicef.png",
        address: "1 Westfield Ave, London, E20 1HZ"),
    Post(
        date: "27/03/2021",
        description:
            "Help us spread awareness about Mental Health issues millions of people face every day!",
        location: "Croydon",
        name: "Mind",
        number: "0201234567",
        time: "09:00",
        logo: "mind.png",
        address: "15-19 Broadway, Stratford, London E15 4BQ")
  ];

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

        body: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Card(
                child: ExpansionTile(
                  //leading: FlutterLogo(size: 72.0),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage('lib/Assets/${posts[index].logo}')),
                  title: Text(posts[index].name),
                  subtitle: Text(posts[index].date +
                      ", " +
                      posts[index].time +
                      "  ---  " +
                      posts[index].location),
                  trailing: Icon(Icons.expand_more),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0, top: 6.5),
                      child: Text(
                        posts[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 13.0),
                      child: Text(
                        ' \u27B4:  ${posts[index].address}',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 13.0),
                      child: Text(
                        ' \u9743:  ${posts[index].number}',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
              );
            }),

// ADDING POST BUTTON, CHANGE THE COLOUR!!!
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