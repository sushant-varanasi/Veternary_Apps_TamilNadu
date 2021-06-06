import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/english/registerPhone.dart';
import 'package:vet_app/english/signIn.dart';
import '../general/auth.dart';
import 'register.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';


class authChoose extends StatefulWidget {
  @override
  _authChooseState createState() => _authChooseState();
}

class _authChooseState extends State<authChoose> {
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
                SizedBox(height: 50),
                Image(
                  image: AssetImage('images/pet.png'),
                  height: 280.0,
                  width: 280.0,
                ),

                /*Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: TextFormField(
                      decoration: textInputDecoration.copyWith(
                          hintText: '10 digit phone number',
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          hoverColor: Colors.blue[900],
                          fillColor: Colors.brown[50]),
                      validator: (val) =>
                      val.isEmpty ? 'Enter a phone number' : null,
                      onChanged: (val) {
                        setState(() {
                          this.phoneNo = '+91' + val;
                        });
                      },
                    )),
                codeSent ? Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: 'Enter OTP'),
                      onChanged: (val) {
                        setState(() {
                          this.smsCode = val;
                        });
                      },
                    )) : Container(),

                SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: RaisedButton(
                      color: Colors.blue[900],
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 25.0),
                        textColor: Colors.white,
                        child: Center(child: codeSent ? Text('Login', style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),):Text('Verify', style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),)),
                        onPressed: () {
                          codeSent ? AuthService().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
                        })),

                SizedBox(height: 20),

                Center(
                  child: Text(
                    'Else',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                  ),
                ),*/
                SizedBox(height: 70),

                Card(
                    color: Colors.blue[900],
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'SIGN IN WITH EMAIL',
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
                                builder: (context) => signIn()));
                      },
                    )),

                /*Center(
                  child: Text(
                    'Options for first time users',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black,
                    ),
                  ),
                ),*/

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

                /*Card(
                    color: Colors.blue[900],
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'REGISTER WITH PHONE NUMBER',
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
                                builder: (context) => registerPhone()));
                      },
                    )),*/




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

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signInph(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
