import 'package:flutter/material.dart';

import 'package:quac/screens/signup/signup_body.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Group_1.png"),
                fit: BoxFit.cover)),
        child: SignupBody());
  }
}
