import 'package:first_app/Service/database.dart';
import 'package:first_app/WelcomePage.dart';
import 'package:flutter/material.dart';
import './HomePageForOrganisation.dart';

import 'package:first_app/WelcomePage.dart';
import 'package:flutter/material.dart';
import './HomePageForOrganisation.dart';

void main() => runApp(new CreatePost());

class CreatePost extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CreatePost> {
  GlobalKey<FormState> _key = new GlobalKey();
  //form  variables
  bool _validate = false;
  String _namee = '';
  String _date;
  String _email = '';
  String _description = '';
  String _contact;
  String _location = '';
  String _commitment = '';

  //dropdown menu values and variables
  String category1 = 'Food Banks';
  String category2 = 'Animal Services';
  String category3 = 'Public Health';

  //final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Post your announcement here!'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: FormUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        CircleAvatar(
          radius: 120,
          backgroundColor: Colors.transparent,
          child: Image.network(''),
        ),
        SizedBox(
          height: 15,
        ),

        //text

        Align(
            alignment: Alignment.center,
            child: Text(
              "Complete the fields below to succesfully post your announcement!",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Text(''),
        Text(''),

        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: buildInputDecoration(Icons.star, "Organization Name"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter your name before submitting';
              }
              return null;
            },
            onSaved: (String value) {
              _namee = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: buildInputDecoration(
                Icons.star, "What date will volunteering commence?"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter availability date';
              }
              return null;
            },
            onSaved: (String value) {
              _date = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: buildInputDecoration(Icons.star, "What is your email?"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            onSaved: (String value) {
              _email = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: buildInputDecoration(Icons.email,
                "Give description of volunteering opportunity here"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter a description of volunteering opportunity ';
              }
              return null;
            },
            onSaved: (String value) {
              _description = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: buildInputDecoration(
                Icons.phone, "How would you like to be contacted?"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter contact info ';
              }

              return null;
            },
            onSaved: (String value) {
              _contact = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: buildInputDecoration(
                Icons.star, "Location of volunteering opportunity"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please add a location!';
              }

              return null;
            },
            onSaved: (String value) {
              _location = value;
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: buildInputDecoration(
                Icons.star, "What is the required commitment time?"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please add commitment time';
              }

              return null;
            },
            onSaved: (String value) {
              _commitment = value;
            },
          ),
        ),

        Align(
            alignment: Alignment.center,
            child: Text(
              "Choose up to the categories that applies to your volunteering opportunity.",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),

        DropdownButton(
          value: category1,
          items: <DropdownMenuItem>[
            DropdownMenuItem(
              value: 'Food Banks',
              child: Text('Food Banks'),
            ),
            DropdownMenuItem(
              value: 'Education',
              child: Text('Education'),
            ),
            DropdownMenuItem(
              value: 'Environment',
              child: Text('Environment'),
            ),
            DropdownMenuItem(
              value: 'Community',
              child: Text('Community'),
            ),
            DropdownMenuItem(
              value: 'Public Health',
              child: Text('Public Health'),
            ),
            DropdownMenuItem(
              value: 'Animal Services',
              child: Text('Animal Services'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              category1 = value;
            });
          },
        ),

        //send button plus validation
        new SizedBox(height: 15.0),
        new RaisedButton(
          onPressed: _sendToServer,
          child: new Text('Send'),
        )
      ],
    );
  }

  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  _sendToServer() async {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Username $_namee");
      print("Phone $_date");
      print("Email $_email");
      print("Description $_description");
      print("Contact $_contact");
      print("Location $_location");
      print("Commitment $_commitment");
      print("Category $category1");
      await DatabaseService().updatePost(_namee, _description, _location, _contact, _date, _commitment);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrganisationHomePage()),
        );
    }
  }
}

InputDecoration buildInputDecoration(IconData icons, String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    prefixIcon: Icon(icons),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.deepPurpleAccent,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
      borderSide: BorderSide(
        color: Colors.deepPurpleAccent,
        width: 1.5,
      ),
    ),
  );
}
