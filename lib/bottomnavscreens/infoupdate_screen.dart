import 'package:flutter/material.dart';
import 'package:digicard/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Infoscreen extends StatefulWidget {
  @override
  _InfoscreenState createState() => _InfoscreenState();
}

class _InfoscreenState extends State<Infoscreen> {
  //set auth and firestore var
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  FirebaseUser loggedInUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
        print(loggedInUser.uid);
        print(loggedInUser.displayName);
      }
    } catch (e) {
      print(e);
    }
  }

  final _formkey = GlobalKey<FormState>();
  bool _autoValidate = false;
  final TextEditingController name = TextEditingController();
  final TextEditingController companyname = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController website = TextEditingController();
  final TextEditingController workaddress = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    name.dispose();
    companyname.dispose();
    occupation.dispose();
    email.dispose();
    website.dispose();
    workaddress.dispose();
    phonenumber.dispose();
    super.dispose();
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  String validateCompanyname(String value) {
    if (value.length < 4)
      return 'companyname must be more than 4 charater';
    else
      return null;
  }

  String validateOccupation(String value) {
    if (value.length < 3)
      return 'Occupation must be more than 3 character';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validateworkAddress(String value) {
    if (value.length < 3) {
      return 'Address must be more than 3 charcter';
    } else
      return null;
  }

  String validatephonenumber(String value) {
// nepali Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  void validateinput() async {
    final form = _formkey.currentState;
    if (form.validate()) {
      // Text forms was validated.
      form.save();
      final snackBar =
          SnackBar(content: Text('Your information has been added'));

// Find the Scaffold in the widget tree and use it to show a SnackBar.
      Scaffold.of(context).showSnackBar(snackBar);

      _firestore.collection('userinfo').add({
        'currentsenderuseremail': loggedInUser.email,
        'currentsenderid': loggedInUser.uid,
        'companyname': companyname.text,
        'email': email.text,
        'name': name.text,
        'occupation': occupation.text,
        'phonenumber': phonenumber.text,
        'website': website.text,
        'workaddress': workaddress.text,
      });
    } else {
      setState(() => _autoValidate = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formkey,
          autovalidate: _autoValidate,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'User_Card_Information',
                      style: TextStyle(
                        fontFamily: 'Karla2',
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                //mainAxisAlignment:MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: TextFormField(
                      controller: name,
                      decoration: KtextFormfieldDecoration.copyWith(
                          hintText: 'Full Name',
                          labelText: 'Full Name',
                          icon: Icon(Icons.person)),
                      keyboardType: TextInputType.text,
                      validator: validateName,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: TextFormField(
                      controller: companyname,
                      decoration: KtextFormfieldDecoration.copyWith(
                          hintText: 'Company Name',
                          labelText: 'Company Name',
                          icon: Icon(Icons.location_city)),
                      keyboardType: TextInputType.text,
                      validator: validateCompanyname,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: TextFormField(
                      controller: occupation,
                      decoration: KtextFormfieldDecoration.copyWith(
                          hintText: 'Occupation',
                          labelText: 'Occupation',
                          icon: Icon(Icons.work)),
                      keyboardType: TextInputType.text,
                      validator: validateOccupation,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: TextFormField(
                      controller: email,
                      decoration: KtextFormfieldDecoration.copyWith(
                          hintText: 'E-mail',
                          labelText: 'E-mail',
                          icon: Icon(Icons.email)),
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: TextFormField(
                      controller: website,
                      decoration: KtextFormfieldDecoration.copyWith(
                          hintText: 'Website',
                          labelText: 'Website',
                          helperText: 'optional',
                          icon: Icon(Icons.blur_circular)),
                      keyboardType: TextInputType.url,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: TextFormField(
                      controller: workaddress,
                      decoration: KtextFormfieldDecoration.copyWith(
                          hintText: 'Work Address',
                          labelText: 'Work Address',
                          icon: Icon(Icons.place)),
                      keyboardType: TextInputType.text,
                      validator: validateworkAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                    child: TextFormField(
                      controller: phonenumber,
                      decoration: KtextFormfieldDecoration.copyWith(
                          hintText: 'Phone Number',
                          labelText: 'Phone number',
                          icon: Icon(Icons.phone)),
                      keyboardType: TextInputType.phone,
                      validator: validatephonenumber,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      color: Colors.pinkAccent,
                      onPressed: validateinput,
                      child: Text(
                        'submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
