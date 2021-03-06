import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/general/constants.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/tamil/registerPhone2.dart';
import '../general/auth.dart';
import 'register2.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                              hintText: '?????????????????????????????? ',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hoverColor: Colors.blue[900],
                              fillColor: Colors.brown[50]),
                          validator: (val) => val.isEmpty ? '??????????????????????????????' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(height: 20),
                      TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(
                              hintText: '?????????????????????????????????',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hoverColor: Colors.blue[900],
                              fillColor: Colors.brown[50]),
                          validator: (val) => val.length < 8
                              ? '8+ ???????????????????????????????????? ???????????????????????? ???????????????????????????????????? ??????????????????????????????'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                      SizedBox(height: 10),
                      Card(
                          color: Colors.blue[900],
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            title: Center(
                              child: Text(
                                '????????????????????????  ',
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
                                Navigator.pop(context);
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
                                    '????????????????????? ????????????????????????????????????????????????????????????',
                                    '???????????????????????? ????????????????????? ???????????????????????????????????????????????????????????? ??????????????????????????????????????? ?????????????????????????????????:' +
                                        email,
                                    platform,
                                  );
                                }

                                if (result == null) {
                                  setState(() {
                                    error =
                                        '???????????? ????????????????????????????????????????????? ???????????????????????? ?????????????????????????????????';
                                    loading = false;
                                  });
                                }
                              }
                            },
                          )),
                      SizedBox(
                        height: 45.0,
                      ),
                      /*Card(
                          color: Colors.blue[900],
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 30.0),
                          child: ListTile(
                            title: Center(
                              child: Text(
                                'SIGN IN WITH PHONE',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )),*/
                      SizedBox(
                        height: 8.0,
                      ),
                      Center(
                        child: Text(
                          '?????????????????? ??????????????????????',
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
                                '???????????????',
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
                      /*
                      Card(
                          color: Colors.blue[900],
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: ListTile(
                            title: Center(
                              child: Text(
                                'REGISTER WITH PHONE',
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
