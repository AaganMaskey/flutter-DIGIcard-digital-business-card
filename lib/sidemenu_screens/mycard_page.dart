import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:flutter/foundation.dart';

final startColor = Color(0xFFaa7ce4);
final endColor = Color(0xFFe46792);
final titleColor = Color(0xff444444);
final textColor = Color(0xFFa9a9a9);
final shadowColor = Color(0xffe9e9f4);
// class AkhilCard extends StatefulWidget {
//   static const String id = "Card Page";
//   @override
//   State<StatefulWidget> createState() {
//     return _AkhilState();
//   }
// }

// class _AkhilState extends State<AkhilCard> {
//   List<UserInfo> userInfoList = [];
//   @override
//   void initState() {
//     super.initState();
//     DatabaseReference userRef= FirebaseDatabase.instance.refrence().child("userInfo")
//   }
// }

class Mycard extends StatefulWidget {
  static const String id = 'Mycard_page';
  @override
  _MycardState createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  // final infos = _firestore.collection('userinfo');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [startColor, endColor]),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 5.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'MyCard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, right: 5),
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              child: ListView(
            children: <Widget>[
              new CardHolder(),
              SizedBox(
                height: 200,
              )
            ],
          )),
        ],
      ),
    );
  }
}

class CardHolder extends StatefulWidget {
  @override
  _CardHolderState createState() => _CardHolderState();
}

class _CardHolderState extends State<CardHolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 150,
        right: 20,
        left: 20,
      ),
      height: 633,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: titleColor.withOpacity(.1),
              blurRadius: 20,
              spreadRadius: 10,
            )
          ]),
      child: new Card(),
    );
  }
}

class Card extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  // get data from the firestore
  String userName = "Akhil Chhetri";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
          stream: Firestore.instance.collection('userinfo').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              Text('Loading data .....');
            }
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/person.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.blueAccent.withOpacity(.3),
                      width: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  snapshot.data.documents[0]['name'],
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(top: 8, right: 20, left: 20),
                  width: 320,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 30,
                        spreadRadius: 5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Card Information',
                            style: TextStyle(color: titleColor, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: 350,
                        child: Divider(
                          height: 1.5,
                          color: titleColor.withOpacity(.3),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_city),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data.documents[0]['companyname'],
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                'Company Name',
                                style: TextStyle(
                                  color: textColor.withOpacity(.5),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.email),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data.documents[0]['email'],
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: textColor.withOpacity(.5),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.work),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data.documents[0]['occupation'],
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                'Occupation',
                                style: TextStyle(
                                  color: textColor.withOpacity(.5),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.blur_circular),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data.documents[0]['website'],
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                'Website',
                                style: TextStyle(
                                  color: textColor.withOpacity(.5),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.place),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data.documents[0]['workaddress'],
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                'Work Address',
                                style: TextStyle(
                                  color: textColor.withOpacity(.5),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.phone_iphone),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot.data.documents[0]['phonenumber'],
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                              Text(
                                'Phone-number',
                                style: TextStyle(
                                  color: textColor.withOpacity(.5),
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                        width: 350,
                        child: Divider(
                          height: 1.5,
                          color: titleColor.withOpacity(.3),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
