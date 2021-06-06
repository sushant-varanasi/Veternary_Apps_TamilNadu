import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vetappadmin/register.dart';

import 'auth.dart';
import 'constants.dart';
import 'loading.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;

  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/as.jpg'), fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/pet.png'),
                        height: 280.0,
                        width: 280.0,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Enter your email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hoverColor: Colors.blue[900],
                              fillColor: Colors.brown[50]),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(height: 20),
                      TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hoverColor: Colors.blue[900],
                              fillColor: Colors.brown[50]),
                          validator: (val) => val.length < 8
                              ? 'Enter an password 8+ characters long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                      SizedBox(height: 30),
                      Card(
                          color: Colors.blue[900],
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            title: Center(
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                                if (result != null) {
                                  var android = new AndroidNotificationDetails(
                                      'channel id',
                                      'channel NAME',
                                      'CHANNEL DESCRIPTION',
                                      priority: Priority.High,
                                      importance: Importance.Max);
                                  var iOS = new IOSNotificationDetails();
                                  var platform =
                                      new NotificationDetails(android, iOS);
                                  await flutterLocalNotificationsPlugin.show(
                                    0,
                                    'You have signed in',
                                    'You can add pets and cases now for the account: ' +
                                        email,
                                    platform,
                                  );
                                }

                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Could not sign in with those credentials';
                                    loading = false;
                                  });
                                }
                              }
                            },
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Card(
                          color: Colors.blue[900],
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            title: Center(
                              child: Text(
                                'REGISTER WITH EMAIL',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => register()));
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

/*
  showNotificationSignIn() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,importance: Importance.Max
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Registration successful', 'you can add pets and cases now', platform,
        payload: 'Welcome! add pets and then cases :)');
  }
  */

}
