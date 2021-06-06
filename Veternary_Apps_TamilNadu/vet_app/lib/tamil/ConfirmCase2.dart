import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vet_app/general/caseBase.dart';

class ConfirmCase extends StatefulWidget {
  final String uid;
  final String imageurl;
  final String audiourl;
  final String puid;
  final String position;
  final String species;
  final String breed;
  final String severity;
  final String about;
  final String year;
  final String finalDate;
  final bool homevisit;
  final bool emergency;
  final String location;
  final int noOfAnimals;
  ConfirmCase(
      {this.uid,
        this.imageurl,
        this.audiourl,
        this.puid,
        this.position,
        this.species,
        this.breed,
        this.severity,
        this.about,
        this.year,
        this.finalDate,
        this.homevisit,
        this.emergency,
        this.location,
        this.noOfAnimals});
  @override
  _ConfirmCaseState createState() => _ConfirmCaseState();
}

class _ConfirmCaseState extends State<ConfirmCase> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('வழக்கை உறுதிப்படுத்தவும்'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: Column(children: <Widget>[
              SizedBox(height: 100),
              ListTile(
                title: Text('பற்றி: ' + widget.about,
                    style: TextStyle(fontSize: 23.0, color: Colors.black)),
                subtitle: Text(
                  'இனப்பெருக்கம்: ' +
                      widget.breed +
                      '\nஇனங்கள்: ' +
                      widget.species +
                      '\nLocID:' +
                      widget.location,
                  style: TextStyle(fontSize: 23.0, color: Colors.black),
                ),
              ),
              ButtonBar(children: <Widget>[
                FlatButton.icon(
                    label: Text(
                      "வழக்கை உறுதிப்படுத்தவும்",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    icon: Icon(
                      Icons.history,
                      color: Colors.black,
                    ),
                    color: Colors.blue[100],
                    onPressed: () async {
                      var android = new AndroidNotificationDetails(
                          'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
                          priority: Priority.High, importance: Importance.Max);
                      var iOS = new IOSNotificationDetails();
                      var platform = new NotificationDetails(android, iOS);
                      await flutterLocalNotificationsPlugin.show(
                          0,
                          'New case added successfully',
                          'Case notified to doctor! ',
                          platform,
                          payload: 'You will get doctor details soon');

                      //Navigator.pop(context);
                      //Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      CaseService().initialiseCaseData(
                          widget.uid,
                          widget.imageurl,
                          widget.audiourl,
                          widget.puid,
                          widget.position,
                          widget.species,
                          widget.breed,
                          widget.severity,
                          widget.about,
                          widget.location,
                          widget.year,
                          widget.finalDate,
                          widget.homevisit,
                          widget.emergency,
                          widget.noOfAnimals);
                    })
              ])
            ])),
      ),
    );
  }
}
