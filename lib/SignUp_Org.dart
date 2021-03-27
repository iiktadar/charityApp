import 'package:first_app/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/oof.dart';
import 'package:first_app/SignUp.dart';
import 'HomePage.dart';
import 'Login_screen.dart';
import './Service/auth.dart';

void main() => runApp(new SignUp_Org());

class SignUp_Org extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<SignUp_Org> {
  GlobalKey<FormState> _key = new GlobalKey();
  //form  variables
  bool _validate = false;
  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';
  String _email = '';
  String _description = '';
  String _phoneNo;
  String _description2 = '';

  //dropdown menu values and variables
  String category1 = 'Food Banks';
  String category2 = 'Animal Services';
  String category3 = 'Public Health';

  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Join our community!'),
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
          child: Image.network(
              'https://image.freepik.com/free-photo/business-success-concept-wooden-table-top-view-hands-protecting-wooden-figures-people_176474-9273.jpg'),
        ),
        SizedBox(
          height: 15,
        ),

        //text

        Align(
            alignment: Alignment.center,
            child: Text(
              "Complete the fields below to succesfully create an account!",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Text(''),
        Text(''),

        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: buildInputDecoration(Icons.star, "Organisation Name"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter your name before submitting';
              }
              return null;
            },
            onSaved: (String value) {
              _userName = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: buildInputDecoration(Icons.star, "Password"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter Password';
              }
              return null;
            },
            onSaved: (String value) {
              _password = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: buildInputDecoration(Icons.star, "Confirm Password"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please confirm your Password';
              }
              return null;
            },
            onSaved: (String value) {
              _confirmPassword = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: buildInputDecoration(Icons.email, "Email"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter your email before submitting';
              }
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return 'Please enter a valid email';
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
            keyboardType: TextInputType.number,
            decoration: buildInputDecoration(Icons.phone, "Phone Number"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter phone number ';
              }
              if (value.length != 10)
                return 'Mobile Number must be of 10 digit';
              else
                //   _formKey.currentState.save();
                return null;
            },
            onSaved: (String value) {
              _phoneNo = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: buildInputDecoration(Icons.star, "Description"),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please add a short bio!';
              }

              return null;
            },
            onSaved: (String value) {
              _description2 = value;
            },
          ),
        ),

        Align(
            alignment: Alignment.center,
            child: Text(
              "Choose up to three categories that applies to your organization.",
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

        DropdownButton(
          value: category2,
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
            DropdownMenuItem(
              value: '',
              child: Text('Does not apply'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              category2 = value;
            });
          },
        ),

        DropdownButton(
          value: category3,
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
            DropdownMenuItem(
              value: '',
              child: Text('No need for another category!'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              category3 = value;
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

  _sendToServer() async{
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Username $_userName");
      print("Phone $_phoneNo");
      print("Email $_email");
      print("Pwd $_password");
      print("PwdConfimr $_confirmPassword");
      print("Description2 $_description2");
      print("Category1 $category1");
      print("Category2 $category2");
      print("Category3 $category3");
      dynamic result = await auth.registerEmailAndPassword(_userName,_email, _password, _phoneNo, _description2);
      if(result == null){
        print("Please supply a valid email");
      }
      else{
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login_screen()),
        );
      }

      
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
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
