import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/LocationBase.dart';

import 'package:vet_app/general/casehelp.dart';
import 'package:vet_app/general/constants.dart';
import 'package:vet_app/english/imagePicker.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/english/animalInfo.dart';
import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/general/locationslist.dart';
import 'package:vet_app/general/petclass.dart';

import 'package:vet_app/general/user.dart';
//import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vet_app/tamil/addlocationtocase2.dart';
import 'package:vet_app/tamil/recordcase2.dart';

class NewCase extends StatefulWidget {
  final PetData petcase;
  final String imageurl;
  NewCase({this.petcase, this.imageurl});
  @override
  _NewCaseState createState() => _NewCaseState();
}

class _NewCaseState extends State<NewCase> {
  //FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
/*
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
  }*/

  //final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final List<bool> bools = [true, false];
  final List<String> list = [
    'home',
    'farm1:pammal',
    'farm2:bodi',
    'farm3:palani'
  ];
  final List<String> severe = ['Low', 'Normal', 'High', 'Very High'];
  // String species = "";
  String imageurl = "";
  String location;
  String severity;
  String about = "";
  bool homevisit = false;
  bool loading = false;
  bool rec = false;
  bool emergency = false;
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
    imageurl = widget.imageurl;
    return StreamProvider<List<LocationData>>.value(
      value: LocBaseService().Locations2,
      child: loading
          ? Loading()
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue[900],
                elevation: 0.0,
                title: Text(
                  '??????????????? ??????????????????',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.live_help),
                    textColor: Colors.white,
                    label: Text(
                      '????????????',
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
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        '?????????????????????: ' + widget.petcase.species,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(height: 20),
                      Text('???????????????????????????????????????: ' + widget.petcase.breed,
                          style: TextStyle(fontSize: 18.0)),
                      SizedBox(height: 20),
                      Text('????????????????????? i.d: ' + widget.petcase.puid,
                          style: TextStyle(fontSize: 18.0)),
                      SizedBox(height: 20),
                      Card(
                        child: Column(
                          children: [
                            TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    hintText: '??????????????????????????? ????????????????????????'),
                                validator: (val) => val.isEmpty && rec == false
                                    ? '????????????????????? ????????????????????????????????????'
                                    : null,
                                onChanged: (val) {
                                  if (val != "") setState(() => about = val);
                                }),
                            ButtonBar(children: [
                              Text('??????????????? ??????????????? ???????????????????????? ????????????????????????'),
                              FlatButton(
                                child: Icon(Icons.mic),
                                onPressed: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Recorder()));
                                    rec = true;
                                  });
                                },
                              )
                            ])
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        decoration: textInputDecoration,
                        hint: Text('?????????????????????'),
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
                      RadioListTile(
                        groupValue: homevisit,
                        title: Text('?????????????????? ??????????????? ????????????'),
                        value: true,
                        onChanged: (val) {
                          setState(() {
                            homevisit = val;
                          });
                        },
                      ),
                      RadioListTile(
                        groupValue: homevisit,
                        title: Text('?????????????????? ??????????????? ??????????????????????????????'),
                        value: false,
                        onChanged: (val) {
                          setState(() {
                            homevisit = val;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      RadioListTile(
                        groupValue: emergency,
                        title: Text('??????????????????'),
                        value: true,
                        onChanged: (val) {
                          setState(() {
                            emergency = val;
                          });
                        },
                      ),
                      RadioListTile(
                        groupValue: emergency,
                        title: Text('???????????????????????? ???????????????'),
                        value: false,
                        onChanged: (val) {
                          setState(() {
                            emergency = val;
                          });
                        },
                      ),
                      RaisedButton(
                          color: Colors.blue[900],
                          child: Text(
                            '????????????????????????',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            getCurrentDate();
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
                                        noOfAnimals: 1)));
                            /*var android = new AndroidNotificationDetails(
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
                                payload: 'You will get doctor details soon');*/
                          }),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
