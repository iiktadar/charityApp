import 'package:first_app/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/oof.dart';
import 'package:first_app/SignUp.dart';
import 'HomePage.dart';
import 'Login_screen.dart';

String _userEmail = '';
String _userName = '';
String _password = '';
String _confirmPassword = '';
String _email = '';
String _description = '';

class SignUp_volunteer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignUp_volunteer> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String name, email, phone;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  //Drop-down menu variables that sores the choice: null value means no category chosen
  String category1 = 'Food Banks';
  String category2 = 'Animal Services';
  String category3 = 'Public Health';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //picture top
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
                //user name
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.person, "User Name "),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your user name before submitting';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),

                // Email
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.email, "Personal Email"),
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
                      email = value;
                    },
                  ),
                ),

                //phone number
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:
                        buildInputDecoration(Icons.phone, "Phone Number"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter phone number ';
                      }
                      if (value.length != 10)
                        return 'Mobile Number must be of 10 digits';
                      else
                        return null;
                    },
                    onSaved: (String value) {
                      phone = value;
                    },
                  ),
                ),

                //password
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.lock, "Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please a enter Password';
                      }
                      return null;
                    },
                  ),
                ),

                //again password
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.lock, "Confirm Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please re-enter password';
                      }
                      print(password.text);

                      print(confirmpassword.text);

                      if (password.text != confirmpassword.text) {
                        return "Password does not match";
                      }

                      return null;
                    },
                  ),
                ),

                //description
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
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
                      _description = value;
                    },
                  ),
                ),

                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Choose up to three categories that interest you the most.",
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

                Text(''),
                Text(''),
                //submit button plus validation
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        print("successful");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login_screen()),
                        );
                      } else {
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    textColor: Colors.white,
                    child: Text("Submit"),
                  ),
                ),
                Text(''),
                Text(''),
              ],
            ),
          ),
        ),
      ),
    );
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
