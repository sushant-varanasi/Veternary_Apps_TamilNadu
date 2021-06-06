import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/general/auth.dart';
import 'package:vet_app/general/constants.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/english/register.dart';
import 'package:vet_app/english/signIn.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';

class registerPhone extends StatefulWidget {
  @override
  _registerPhoneState createState() => _registerPhoneState();
}

class _registerPhoneState extends State<registerPhone> {
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

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String name = "";
  String mobile = "";
  String email = "";
  String aadhaar = "";
  String location = "";
  String password = "";
  String error = "";
  bool loading = false;

  /*

  */

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/a.jpg'),
                fit: BoxFit.cover)),
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 50),
        child: Form(
          key: _formKey2,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),

              TextFormField(
                  decoration:
                  textInputDecoration.copyWith(hintText: 'Name'),
                  validator: (val) =>
                  val.isEmpty ? 'Enter a Name' : null,
                  onChanged: (val) {
                    setState(() => name = val);
                  }),

              SizedBox(height: 20),
              TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Aadhaar card number'),
                  validator: (val) =>
                  val.isEmpty
                      ? 'Enter your Aadhaar number'
                      : null,
                  onChanged: (val) {
                    setState(() => aadhaar = val);
                  }),
              SizedBox(height: 40),
              Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
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
                          vertical: 10.0, horizontal: 25.0),
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
                        codeSent ? AuthService().registerWithOTP(
                            smsCode, verificationId, name, aadhaar, phoneNo):verifyPhone(phoneNo);
                      })),
              SizedBox(height: 30),
/*
              Card(
                color: Colors.blue[900],
                margin: EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 45.0),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onTap: () async {
                    if (_formKey2.currentState.validate()) {
                      setState(() => loading = true);

                      dynamic result =
                      await _auth.registerWithEmailAndPassword(
                          email,
                          password,
                          name,
                          location,
                          mobile,
                          aadhaar);
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
                            'Act Registration successful',
                            'you can add pets and cases now',
                            platform,
                            payload: 'Welcome!' +
                                name +
                                'add pets and then cases :)');
                      }

                      if (result == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                          loading = false;
                        });
                      }
                    }
                  },
                ),
              ),*/
              Text(error,
                  style: TextStyle(color: Colors.red, fontSize: 14)),
              Center(
                child: Text(
                  'Other options',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Card(
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
                  )),

              Card(
                  color: Colors.blue[900],
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 30.0),
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

              Card(
                  color: Colors.blue[900],
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 30.0),
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
    );

  }


/*
showNotification() async {
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
