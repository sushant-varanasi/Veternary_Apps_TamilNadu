import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/general/loading.dart';

import 'package:vet_app/general/textdecor.dart';
import 'package:vet_app/general/user.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/petbase.dart';
import 'package:vet_app/english/imagePicker.dart';
import 'package:vet_app/tamil/data2.dart';
import 'package:vet_app/tamil/locationhelp2.dart';

class newLocation extends StatefulWidget {
  @override
  _newLocationState createState() => _newLocationState();
}

class _newLocationState extends State<newLocation> {
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

  final TextEditingController _typeAheadController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String name = "";
  bool loading = false;
  String uid = "";
  Position position;
  String village = "";

  String pos = '';

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
              title: Text('புதிய இடம்'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.help),
                  textColor: Colors.white,
                  label: Text(
                    'உதவி',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationHelp()));
                  },
                ),
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
                constraints: BoxConstraints.expand(),
                padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
                child: Form(
                    key: _formKey,
                    child: ListView(children: <Widget>[
                      Container(
                        child: pos == ""
                            ? Text(' இடம் வழங்கப்படவில்லை')
                            : Text('இடம்: $pos'),
                      ),
                      FlatButton(
                        child: Text(
                          'தற்போதைய இருப்பிடத்தை எடுக்க கிளிக் செய்க',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue[900],
                        onPressed: () async {
                          position = await Geolocator().getCurrentPosition(
                              desiredAccuracy: LocationAccuracy.high);
                          print(position);
                          setState(() {
                            pos = position.latitude.toString() +
                                ',' +
                                position.longitude.toString();
                          });

                          var android = new AndroidNotificationDetails(
                              'channel id',
                              'channel NAME',
                              'CHANNEL DESCRIPTION',
                              priority: Priority.High,
                              importance: Importance.Max);
                          var iOS = new IOSNotificationDetails();
                          var platform = new NotificationDetails(android, iOS);
                          await flutterLocalNotificationsPlugin.show(
                            0,
                            'இடம் வெற்றிகரமாக சேர்க்கப்பட்டது',
                            'உங்கள் தற்போதைய இடம் சேமிக்கப்பட்டுள்ளது',
                            platform,
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'நகரம் / நகரம் / கிராமம்'),
                          controller: this._typeAheadController,
                        ),
                        suggestionsCallback: (pattern) {
                          return CitiesService.getSuggestions(pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion),
                          );
                        },
                        transitionBuilder:
                            (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (suggestion) {
                          this._typeAheadController.text = suggestion;
                          village = suggestion;
                        },
                        validator: (value) => value.isEmpty
                            ? 'ஒரு விருப்பத்தைத் தேர்ந்தெடுக்கவும்'
                            : null,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'இருப்பிடத்தின் பெயர் - வீடு, பண்ணை'),
                          validator: (val) => val.isEmpty
                              ? 'உங்கள் இடத்தின் பெயரை உள்ளிடவும்'
                              : null,
                          onChanged: (val) {
                            //if (val != "") setState(() => name = val);
                            if (val != "")
                              setState(() => {
                                    name = val,
                                  });
                          }),
                      SizedBox(height: 20),
                      RaisedButton(
                          color: Colors.blue[900],
                          child: Text(
                            'புதிய இருப்பிடத்தைச் சேர்க்கவும்',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            if (_formKey.currentState.validate()) {
                              await LocBaseService()
                                  .initializeLocData(uid, name, pos, village);
                            }
                          })
                    ]))));
  }
}
