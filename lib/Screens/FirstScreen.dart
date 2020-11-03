import 'package:flutter/material.dart';
import 'package:pradeep/Screens/LoginScreen.dart';
import 'package:pradeep/sign_in/sign_in.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Welcome to your Farm'),
          actions: <Widget>[
          // action button
            RaisedButton(
              onPressed: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginScreen();}), ModalRoute.withName('/'));
              },color: Colors.blue,
//              color: Colors.blueAccent,
              child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 18, color: Colors.white, backgroundColor: Colors.blue),
                  ),
          )])

    );
           }}