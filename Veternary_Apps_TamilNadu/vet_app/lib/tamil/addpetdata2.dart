import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/general/textdecor.dart';
import 'package:vet_app/general/user.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/petbase.dart';

import 'package:vet_app/general/animalhelp.dart';
import 'package:vet_app/tamil/imagePicker.dart';

class AddPet extends StatefulWidget {
  final String url;

  AddPet({this.url});

  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

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

  final _formKey = GlobalKey<FormState>();
  final List<String> animals = ['நாய்', 'பூனை', 'பறவை', 'மாடு'];
  String animal;
  String name = "";
  String breed = "";
  String history = "";
  bool loading = false;
  String uid = "";
  String year = '';
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);
    uid = user2.uid;
    final int i = 1;
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Colors.blue[900],
              elevation: 0.0,
              title: Text('புதிய செல்லம்'),
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
                        MaterialPageRoute(builder: (context) => AnimalHelp()));
                  },
                ),
              ],
            ),
            body: Container(
                constraints: BoxConstraints.expand(),
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: Form(
                    key: _formKey,
                    child: ListView(children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ImageCapture(i: i)));
                        },
                        child: Center(
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlatButton(
                              color: Colors.blue[900],
                              child: Text(
                                "படத்தைச் சேர்க்கவும்",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ImageCapture(i: i)));
                              },
                            ),
                          ]),
                      SizedBox(height: 20),
                      TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'பெயர்t'),
                          onChanged: (val) {
                            //if (val != "") setState(() => name = val);
                            if (val != "")
                              setState(() => {
                                    name = val,
                                  });
                          }),
                      SizedBox(height: 20),
                      /*TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Year of birth'),
                          validator: (val) =>
                              val.isEmpty ? 'Please enter info' : null,
                          onChanged: (val) {
                            // if (val != "") setState(() => about = val);
                          }),*/
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'இனப்பெருக்கம்'),
                          onChanged: (val) {
                            if (val != "") setState(() => breed = val);
                          }),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        decoration: textInputDecoration,
                        value: animal,
                        hint: Text('இனங்கள்'),
                        items: animals.map((pet) {
                          return DropdownMenuItem(
                            value: pet,
                            child: Text('$pet'),
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
                          decoration: textInputDecoration.copyWith(
                              hintText: 'மருத்துவ வரலாறு'),
                          validator: (val) =>
                              val.isEmpty ? 'தகவலை உள்ளிடவும்' : null,
                          onChanged: (val) {
                            if (val != "") setState(() => history = val);
                          }),
                      SizedBox(height: 20),
                      RaisedButton(
                          color: Colors.blue[900],
                          child: Text(
                            'புதிய செல்லப்பிராணியைச் சேர்க்கவும்',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            if (_formKey.currentState.validate()) {
                              if (name == "") name = animal;
                              if (breed == "") breed = animal;
                              await PetBaseService().initializePetData(
                                  uid, name, animal, breed, history, year);

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
                                  'New pet/animal added successfully',
                                  'You can add cases of your pet named \"' +
                                      name +
                                      '\"',
                                  platform,
                                  payload:
                                      'Go to cases to register a case for this pet');
                            }
                          })
                    ]))));
  }
}
