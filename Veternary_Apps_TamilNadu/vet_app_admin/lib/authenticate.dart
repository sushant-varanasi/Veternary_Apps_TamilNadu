import 'package:flutter/cupertino.dart';
import 'package:vetappadmin/register.dart';
import 'package:vetappadmin/signIn.dart';

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
      return signIn(/*tv: toggleView*/);
    } else {
      return register(/*tv: toggleView*/);
    }
  }
}
