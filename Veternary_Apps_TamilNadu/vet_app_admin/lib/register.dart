import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vetappadmin/signIn.dart';
import 'auth.dart';
import 'constants.dart';
import 'loading.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
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
  final _formKey2 = GlobalKey<FormState>();
  String name = "";
  String mobile = "";
  String email = "";
  String aadhaar = "";
  String location = "";
  String password = "";
  String error = "";
  bool loading = false;
  bool pt2 = false;

  /*






  */
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : pt2
            ? Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/a.jpg'),
                          fit: BoxFit.cover)),
                  padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
                  child: Form(
                    key: _formKey2,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 20),
                        TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'Email'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an Email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password'),
                            obscureText: true,
                            validator: (val) => val.length < 8
                                ? 'Enter an password 8+ characters long'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Confirm Password'),
                            obscureText: true,
                            validator: (val) => val != password
                                ? 'Passwords don\'t match.'
                                : null,
                            onChanged: (val) {}),
                        SizedBox(height: 20),
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
                                        email, password, name, mobile, aadhaar);
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
                        ),
                        SizedBox(height: 12),
                        Text(error,
                            style: TextStyle(color: Colors.red, fontSize: 14)),
                        Center(
                          child: Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Card(
                            color: Colors.blue[900],
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 45.0),
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
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )),
                      ],
                    ),
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: Colors.transparent,
                body: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/a.jpg'),
                          fit: BoxFit.cover)),
                  padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
                  child: Form(
                    key: _formKey,
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
                                hintText: 'Phone Number'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter your phone number' : null,
                            onChanged: (val) {
                              setState(() => mobile = val);
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Location'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter your location' : null,
                            onChanged: (val) {
                              setState(() => location = val);
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Aadhaar card number'),
                            validator: (val) => val.isEmpty
                                ? 'Enter your Aadhaar number'
                                : null,
                            onChanged: (val) {
                              setState(() => aadhaar = val);
                            }),
                        SizedBox(height: 20),
                        Card(
                          color: Colors.blue[900],
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 45.0),
                          child: ListTile(
                            title: Center(
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => pt2 = true);
                              }
                            },
                          ),
                        ),
                        Text(error,
                            style: TextStyle(color: Colors.red, fontSize: 14)),
                        SizedBox(height: 8),
                        Center(
                          child: Text(
                            'Else',
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
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

}
