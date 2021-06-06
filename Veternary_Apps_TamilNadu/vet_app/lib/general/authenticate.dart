import 'package:flutter/material.dart';
import 'package:vet_app/english/authchoose.dart';
import 'package:vet_app/english/register.dart';
import 'package:vet_app/english/signINAnon.dart';
import 'package:vet_app/english/signIn.dart';
import 'package:vet_app/english/signInPhone.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(()=> showSignIn =!showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return signInPhone(/*tv: toggleView*/);
    }
    else{
      return register(/*tv: toggleView*/);
    }
  }


}



