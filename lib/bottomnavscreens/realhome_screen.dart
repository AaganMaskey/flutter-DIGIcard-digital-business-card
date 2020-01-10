import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RealhomeScreen extends StatefulWidget {
  @override
  _RealhomeScreenState createState() => _RealhomeScreenState();
}

class _RealhomeScreenState extends State<RealhomeScreen> {
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'information form database that remain to assign card UI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(snapshot.data.documents[0]['currentsenderid']),
                Text(snapshot.data.documents[0]['currentsenderuseremail']),
                Text(snapshot.data.documents[0]['name']),
                Text(snapshot.data.documents[0]['companyname']),
                Text(snapshot.data.documents[0]['email']),
                Text(snapshot.data.documents[0]['workaddress']),
                Text(snapshot.data.documents[0]['phonenumber']),
                Text(snapshot.data.documents[0]['occupation']),
                Text(snapshot.data.documents[0]['website']),
              ],
            );
          }),
    );
  }
}
