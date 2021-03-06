import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/english/locationhelp.dart';
import 'package:vet_app/general/textdecor.dart';
import 'package:vet_app/general/user.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/petbase.dart';
import 'package:vet_app/english/imagePicker.dart';

import 'data.dart';

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
              title: Text('New Location'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.help),
                  textColor: Colors.white,
                  label: Text('HELP',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LocationHelp()));
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
                            ? Text('Location not provided')
                            : Text('Location: $pos'),
                      ),
                      FlatButton(
                        child: Text('Click to take current Location',
                          style: TextStyle(color: Colors.white),),
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
                            'Location added successfully',
                            'your current location has been stored',
                            platform,
                          );
                        },
                      ),

                      SizedBox(height: 20),
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration:
                          textInputDecoration.copyWith(hintText: 'City/town/village'),
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
                        transitionBuilder: (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (suggestion) {
                          this._typeAheadController.text = suggestion;
                          village=suggestion;
                        },
                        validator: (value) =>
                        value.isEmpty ? 'Please select an option' : null,
                         ),

                      SizedBox(height: 20),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Name of the location eg. Home, Farm'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your Name of place' : null,
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
                            'Add new location',
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
