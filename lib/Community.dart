import 'package:flutter/material.dart';
import './Education.dart';
import './Food.dart';
import './Community.dart';
import './Environment.dart';
import './AnimalServices.dart';
import './HomePage.dart';
import 'AlertBoard.dart';
import 'HomePageForOrganisation.dart';
import 'ProfilePage.dart';
import './Service/post.dart';

class Community extends StatelessWidget {

    List<Post> posts = [
    Post(
        date: "28/03/2021",
        description:
            "Join us in our march to ask for better conditions for refugees",
        location: "Leeds",
        name: "UNICEF UK",
        number: "0205225113",
        time: "18:00",
        logo: "unicef.png",
        address: "1 Westfield Ave, Leeds, LU2 1HZ")];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Styling the top app bar with added icons
        appBar: AppBar(
          title: Text(
            'Community',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Colors.indigo[100],
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle_outlined),
              tooltip: 'Inc',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            )
          ],
        ),
// The body contains the search bar, defined in the class at the end of the page.
        //body: searchBar(),
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
        // this is the code for the side navigation bar, with list of options
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
                      ListTile(
                        leading: Icon(Icons.star),
                        title: Text("Alert Board"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AlertBoard()));
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

class searchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: TextField(
        style: TextStyle(fontSize: 14, color: Colors.black),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
            hintText: "Search for Charities",
            hintStyle: TextStyle(fontSize: 14, color: Colors.black)),
      ),
    );
  }
}
