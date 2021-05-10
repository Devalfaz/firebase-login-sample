import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:quac/core/constants.dart';
import 'package:quac/core/g_auth.dart';
import 'package:quac/core/email_auth.dart';
import 'package:quac/core/f_auth.dart';
import 'package:quac/screens/signup/signup.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Container(
          child: Image.asset("assets/images/Page_1.png"),
          height: size.height * .3,
          width: size.width * .5,
        ),
        Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 50, 0, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: TextFormField(
                  validator: (value) {
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter valid email address';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    print(value);
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: 'Your Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 50, 0, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  validator: (val) =>
                      val.length < 6 ? 'Password is too short.' : null,
                  onSaved: (value) {
                    print(value);
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
            onTap: () {
              print('presssed');
              if (!_formkey.currentState.validate()) {
                return;
              }
            },
            child: Container(
              child: Center(
                  child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 5,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              )),
              margin: EdgeInsets.symmetric(vertical: 30),
              padding: EdgeInsets.symmetric(vertical: 15),
              width: size.width * 0.4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 50, 0, .2),
                      blurRadius: 20.0,
                      offset: Offset(0, 10))
                ],
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(82, 119, 250, 100),
                  Color.fromRGBO(0, 232, 128, 100)
                ]),
                borderRadius: BorderRadius.circular(29),
              ),
            )),
        SizedBox(height: 20),
        SignInButton(Buttons.Google, onPressed: () {
          signInWithGoogle()
              .then((value) => print(value.user))
              .catchError((e) => {print(e)});
        }),
        SignInButton(Buttons.FacebookNew,
            onPressed: () => {
                  signInWithFacebook()
                      .then((value) => print(value.user))
                      .catchError((e) => {print(e)})
                }),
        SignInButton(Buttons.Email, text: 'Signup with Email', onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Signup()));
        }),
        SizedBox(height: 30)
      ],
    );
  }
}
