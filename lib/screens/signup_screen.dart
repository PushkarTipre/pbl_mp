import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pbl_mp/main.dart';
import 'package:pbl_mp/reusable_widgets/reuseable_Widgets.dart';

import '../utils/colours.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sign Up',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexToStringColour('CB2B93'),
            hexToStringColour('9546C4'),
            hexToStringColour('5E61F4'),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: [
                Hero(
                  tag: 'logo1',
                  child: Image.asset(
                    'images/logo1.png',
                    height: 240,
                    width: 240,
                  ),
                ),
                SizedBox(height: 20.0),
                reuseableTextField('Enter Username', Icons.person_outlined,
                    false, _usernameTextController),
                SizedBox(height: 20.0),
                reuseableTextField('Enter Email', Icons.email_outlined, false,
                    _emailTextController),
                SizedBox(height: 20.0),
                reuseableTextField('Enter Password', Icons.lock, true,
                    _passwordTextController),
                SizedBox(
                  height: 20.0,
                ),
                signInSignUpButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print('NEW ACCOUNT');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("ERROR ${error.toString()}");
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
