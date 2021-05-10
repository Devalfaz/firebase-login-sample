import 'package:flutter/material.dart';

class Onboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.cyan,  
      ),
      body: Center(
        child: Text('This is onBoard'),
      ),
      ),
    );
  }
}