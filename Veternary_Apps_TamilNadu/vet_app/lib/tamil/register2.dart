import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/general/auth.dart';
import 'package:vet_app/general/constants.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/tamil/signINAnon2.dart';
import 'package:vet_app/tamil/signIn2.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
        title: new Text('அறிவிப்பு'),
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
                            decoration: textInputDecoration.copyWith(
                                hintText: 'மின்னஞ்சல்'),
                            validator: (val) =>
                                val.isEmpty ? 'மின்னஞ்சலை உள்ளிடவும்' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'கடவுச்சொல்'),
                            obscureText: true,
                            validator: (val) => val.length < 8
                                ? '8+ எழுத்துக்கள் நீளமுள்ள கடவுச்சொல்லை உள்ளிடவும்'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'கடவுச்சொல்லை உறுதிப்படுத்தவும்'),
                            obscureText: true,
                            validator: (val) => val != password
                                ? 'கடவுச்சொற்கள் பொருந்தவில்லை.'
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
                                'பதிவு',
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
                                      'செயல் பதிவு வெற்றிகரமாக',
                                      'நீங்கள் இப்போது செல்லப்பிராணிகளையும் வழக்குகளையும் சேர்க்கலாம்',
                                      platform,
                                      payload: 'வரவேற்பு!' +
                                          name +
                                          'செல்லப்பிராணிகளைச் சேர்த்து பின்னர் வழக்குகள் :)');
                                }

                                if (result == null) {
                                  setState(() {
                                    error =
                                        'செல்லுபடியாகும் மின்னஞ்சலை வழங்கவும்';
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
                            'ஏற்கனவே ஒரு கணக்கு உள்ளதா?',
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
                                  'உள்நுழைக',
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
                                textInputDecoration.copyWith(hintText: 'பெயர்'),
                            validator: (val) => val.isEmpty ? 'பெயர்' : null,
                            onChanged: (val) {
                              setState(() => name = val);
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'தொலைபேசி எண்'),
                            validator: (val) =>
                                val.isEmpty ? 'தொலைபேசி எண்' : null,
                            onChanged: (val) {
                              setState(() => mobile = val);
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'இடம்'),
                            validator: (val) => val.isEmpty ? 'இடம்' : null,
                            onChanged: (val) {
                              setState(() => location = val);
                            }),
                        SizedBox(height: 20),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'ஆதார் அட்டை எண்'),
                            validator: (val) => val.isEmpty
                                ? 'ஆதார் அட்டை எண் Aadhaar number'
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
                                'அடுத்தது',
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
                        /*Center(
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
                                  'SIGN IN WITH PHONE',
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
                                        builder: (context) => SignInAnon()));
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
                            )),*/
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
