import 'package:flutter/material.dart';
import 'package:vetappvet/register.dart';
import 'package:vetappvet/signInPhone.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return signInPhone();
    } else {
      return register();
    }
  }
}
