import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'package:vet_app/general/casehelp.dart';
import 'package:vet_app/general/constants.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/general/user.dart';
import 'package:vet_app/english/imagePicker.dart';
import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/tamil/addlocationtocase2.dart';
import 'package:vet_app/tamil/recordcase2.dart';

class NewDumCase extends StatefulWidget {
  final String location;
  final PetData petcase;
  final String imageurl;
  final int noOfAnimals;
  final int i;
  NewDumCase(
      {this.petcase, this.imageurl, this.location, this.noOfAnimals, this.i});
  @override
  _NewDumCaseState createState() => _NewDumCaseState();
}

class _NewDumCaseState extends State<NewDumCase> {
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

  //final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final List<bool> bools = [true, false];
  final List<String> severe = ['Low', 'Normal', 'High', 'Very High'];
  final List<String> list = [
    'home',
    'farm1:pammal',
    'farm2:bodi',
    'farm3:palani'
  ];
  // String url = '';
  // String species = "";
  String location = "";
  String severity = null;
  String imageurl = "";
  String aurl = "";
  String about = "";
  bool homevisit = false;
  bool emergency = false;
  bool loading = false;
  bool rec = false;
  String uid = "";
  // String breed = "";
  String puid = "";
  String finalDate = '';

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    setState(() {
      finalDate = formattedDate.toString();
      //Access date by using $finalDate
      //Changes to be made in database
    });
  }

  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);
    uid = user2.uid;

    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Colors.blue[900],
              elevation: 0.0,
              title: Text(
                'புதிய போலி வழக்கு',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.live_help),
                  textColor: Colors.white,
                  label: Text(
                    'உதவி',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CaseHelp()));
                  },
                ),
              ],
            ),
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bg.png'), fit: BoxFit.cover)),
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'இனங்கள்: ' + widget.petcase.species,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 20),
                    Text('இனப்பெருக்கம்: ' + widget.petcase.breed,
                        style: TextStyle(fontSize: 18.0)),
                    SizedBox(height: 20),
                    Text('விலங்கு i.d: ' + widget.petcase.puid,
                        style: TextStyle(fontSize: 18.0)),
                    SizedBox(height: 20),
                    Card(
                      child: Column(
                        children: [
                          TextFormField(
                              decoration: textInputDecoration.copyWith(
                                  hintText: 'சிக்கலின் விளக்கம்'),
                              validator: (val) => val.isEmpty && rec == false
                                  ? 'சிக்கலை விவரிக்கவும் '
                                  : null,
                              onChanged: (val) {
                                if (val != "") setState(() => about = val);
                              }),
                          ButtonBar(children: [
                            Text('பதிவு செய்ய மைக்கைத் தட்டவும்'),
                            FlatButton(
                              child: Icon(Icons.mic),
                              onPressed: () {
                                setState(() {
                                  rec = true;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Recorder()));
                                });
                              },
                            )
                          ])
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    /*RaisedButton(
                      color: Colors.blue[900],
                      child: Text(
                        'Select Location',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocationSelectionList(
                                      caselocation: location)));
                        });
                      },
                    ),*/
                    /*DropdownButtonFormField(
                      decoration: textInputDecoration,
                      hint: Text('Location'),
                      value: location,
                      items: list.map((locate) {
                        return DropdownMenuItem(
                          value: locate,
                          child: Text('$locate'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => location = val),
                    ),*/
                    //SizedBox(height: 20),
                    DropdownButtonFormField(
                      decoration: textInputDecoration,
                      hint: Text('தீவிரம்'),
                      value: severity,
                      items: severe.map((sev) {
                        return DropdownMenuItem(
                          value: sev,
                          child: Text('$sev'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => severity = val),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField(
                      decoration: textInputDecoration,
                      hint: Text('ஹோம்விசிட் தேவை'),
                      value: homevisit,
                      items: bools.map((pet) {
                        return DropdownMenuItem(
                          value: pet,
                          child: pet
                              ? Text('ஹோம்விசிட் தேவை')
                              : Text('ஹோம்விசிட் தேவையில்லை'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => homevisit = val),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      color: Colors.blue[900],
                      child: Text(
                        'இருப்பிடத்தைச் சேர்க்கவும்',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddLoctoCase(
                                    uid: uid,
                                    imageurl: widget.imageurl,
                                    puid: widget.petcase.puid,
                                    species: widget.petcase.species,
                                    breed: widget.petcase.breed,
                                    severity: severity,
                                    about: about,
                                    year: widget.petcase.year,
                                    finalDate: finalDate,
                                    homevisit: homevisit,
                                    emergency: emergency,
                                    noOfAnimals: widget.noOfAnimals)));
                      },
                    )
                    /*RaisedButton(
                        color: Colors.blue[900],
                        child: Text(
                          'Add case and notify doctors',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          getCurrentDate();
                          Navigator.pop(context);

                          Navigator.pop(context);

                          Navigator.pop(context);

                          if (_formKey.currentState.validate()) {
                            await CaseService().initialiseCaseData(
                                uid,
                                url,
                                widget.petcase.puid,
                                widget.petcase.species,
                                widget.petcase.breed,
                                severity,
                                about,
                                location,
                                widget.petcase.year,
                                finalDate,
                                homevisit,
                                emergency);

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
                                'New case added successfully',
                                'Case notified to doctor! ',
                                platform,
                                payload: 'You will get doctor details soon');
                          }
                        }),*/
                  ],
                ),
              ),
            ),
          );
  }
}
