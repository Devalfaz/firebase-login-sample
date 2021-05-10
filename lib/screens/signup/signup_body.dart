import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:quac/core/constants.dart';
import 'package:quac/core/g_auth.dart';
import 'package:quac/core/email_auth.dart';
import 'package:quac/core/f_auth.dart';

class SignupBody extends StatefulWidget {
  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirm = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Form(
          key: _formkey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 50, 0, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value.length < 1) {
                        return 'Field is empty';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.name,
                    onSaved: (value) {
                      print(value);
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: kPrimaryColor, fontStyle: FontStyle.italic),
                      hintText: 'First Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 50, 0, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Center(
                  child: TextFormField(
                    validator: (value) {
                      if (value.length < 1) {
                        return 'Field is empty';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.name,
                    onSaved: (value) {
                      print(value);
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: kPrimaryColor, fontStyle: FontStyle.italic),
                      hintText: 'Last Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Form(
          key: _formkey1,
          child: Column(
            children: [
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
                    errorStyle: TextStyle(
                        color: kPrimaryColor, fontStyle: FontStyle.italic),
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: 'Email',
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
                  controller: _pass,
                  validator: (val) =>
                      val.length < 6 ? 'Password is too short.' : null,
                  onSaved: (value) {
                    print(value);
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        color: kPrimaryColor, fontStyle: FontStyle.italic),
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
                  controller: _confirm,
                  validator: (val) =>
                      val != _pass.text ? 'Password doesnt match' : null,
                  onSaved: (value) {
                    print(value);
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(
                        color: kPrimaryColor, fontStyle: FontStyle.italic),
                    hintText: 'Confirm Password',
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
              GestureDetector(
                  onTap: () {
                    print('presssed');
                    if (!_formkey.currentState.validate() ||
                        !_formkey1.currentState.validate()) {
                      return;
                    } else {
                      signup('alfasmirbz@gmail.com', 'password')
                          .then((value) => print(value.user))
                          .catchError((e) => {print(e)});
                    }
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      'Sign Up',
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
                    ),
                  )),
              SignInButton(Buttons.Google, text: 'Signup with Google',
                  onPressed: () {
                signInWithGoogle()
                    .then((value) => print(value.user))
                    .catchError((e) => {print(e)});
              }),
              SignInButton(Buttons.FacebookNew,
                  text: 'Signup with Facebook',
                  onPressed: () => {
                        signInWithFacebook()
                            .then((value) => print(value.user))
                            .catchError((e) => {print(e)})
                      }),
              SizedBox(height: 30)
            ],
          ),
        )
      ],
    );
  }
}
