import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:vet_app/general/loading.dart';

import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/general/textdecor.dart';
import 'package:vet_app/general/user.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/petbase.dart';
import 'package:vet_app/tamil/addimagepage2.dart';

class AddDPet extends StatefulWidget {
  @override
  _AddDPetState createState() => _AddDPetState();
}

class _AddDPetState extends State<AddDPet> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  String puid = PetBaseService().randomPuid();
  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: nSelectNotification);
  }

  Future nSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('அறிவிப்பு'),
        content: new Text('$payload'),
      ),
    );
  }

  final _formKey3 = GlobalKey<FormState>();
  final List<String> animals = ['நாய்', 'பூனை', 'பறவை', 'மாடு'];
  String animal;
  String breed = "";
  String history = "";
  bool loading = false;
  String uid = "";
  String year = "";
  int animalnumber = -1;
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);
    uid = user2.uid;
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Colors.blue[900],
              elevation: 0.0,
              title: Text('புதிய விலங்கு'),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  // tooltip: 'Add new entry',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
                child: Form(
                    key: _formKey3,
                    child: ListView(children: <Widget>[
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'இனப்பெருக்கம்'),
                          onChanged: (val) {
                            if (val != "") setState(() => breed = val);
                          }),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        decoration: textInputDecoration,
                        hint: Text('இனங்கள்'),
                        value: animal,
                        items: animals.map((pet1) {
                          return DropdownMenuItem(
                            value: pet1,
                            child: Text('$pet1'),
                          );
                        }).toList(),
                        onChanged: (val) => setState(() => animal = val),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'ஆண்டு'),
                          onChanged: (val) {
                            if (val != "") setState(() => year = val);
                          }),
                      SizedBox(height: 20),
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'எண்'),
                          onChanged: (val) {
                            if (val != Null)
                              setState(() => animalnumber = val as int);
                          }),
                      SizedBox(height: 20),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'மருத்துவ வரலாறு'),
                          onChanged: (val) {
                            if (val != "") setState(() => history = val);
                          }),
                      SizedBox(height: 20),
                      RaisedButton(
                          color: Colors.blue[900],
                          child: Text(
                            'புதிய விலங்கு சேர்க்கவும்',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddImage(
                                      noOfAnimals: animalnumber,
                                      petcase: PetData(
                                          puid: puid,
                                          name: animal,
                                          breed: breed,
                                          species: animal,
                                          history: history,
                                          uid: uid)),
                                ));

                            if (_formKey3.currentState.validate()) {
                              if (breed == "") breed = animal;
                              await PetBaseService(puid: puid)
                                  .initializeDPetData(uid, animal, breed,
                                      history, year, animalnumber);
                              print(puid);

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
                                  animal + ' added successfully',
                                  '\"',
                                  platform,
                                  payload:
                                      'Go to cases to register a case for this Animal');
                            }
                          }),
                    ]))));
  }
}
