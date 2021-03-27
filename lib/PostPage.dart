import 'package:flutter/material.dart';
import './HomePageForOrganisation.dart';

class CreatePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[100],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrganisationHomePage()));
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Create Job Post!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              // upload post button- connect to back-end to upload post onto alert page
              child: Icon(Icons.file_upload, color: Colors.white),
            ),
          ],
        ),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          ListView(
            children: [
              SizedBox(height: 30),
              Text(
                  "Enter in the description of available volunteering postions in the following fields!!",
                  textAlign: TextAlign.center),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 14,
                      ),
                      hintText: "Name of Organisation",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.border_color,
                        color: Colors.grey,
                        size: 14,
                      ),
                      hintText:
                          " Give description of volunteering opportunity here ",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.place,
                        color: Colors.grey,
                        size: 14,
                      ),
                      hintText: " Location of volunteering opportunity",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.local_phone,
                        color: Colors.grey,
                        size: 14,
                      ),
                      hintText: "How should people contact you?",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
              ),
              SizedBox(height: 35),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                        size: 14,
                      ),
                      hintText: "What date will volunteering commence?",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextField(
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.access_alarm,
                        color: Colors.grey,
                        size: 14,
                      ),
                      hintText: "What is the required commitment time?",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}