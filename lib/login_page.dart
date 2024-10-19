// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Text(
            'Welcome !',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
          Image.asset(
            'lib/assets/welcome.png',
          ),
        ],
      )),
    );
  }
}
