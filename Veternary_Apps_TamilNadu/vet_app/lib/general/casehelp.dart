import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../english/drawer.dart';
import 'loading2.dart';

class CaseHelp extends StatefulWidget {
  @override
  _CaseHelpState createState() => _CaseHelpState();
}

class _CaseHelpState extends State<CaseHelp> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //final projdata = Provider.of<ProjData>(context);

    return loading
        ? Loading2()
        : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.blue[900],
          elevation: 0.0,
          title: Text(
            'Help',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.arrow_back),
              textColor: Colors.white,
              label: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),

      body: Container(
        constraints: BoxConstraints.expand(),
        child: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' Tell us about the problem that your animal is facing.   ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                 leading: Icon(Icons.note_add,
                 color: Colors.blue[900],),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    'Voice Description',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' This helps you to record your voice message. You can tell us about your problem by clicking on this option. The Mic will automatically start to record after clicking on the button.   ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  leading: Icon(Icons.mic,
                    color: Colors.blue[900],),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    'Location',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' You can choose your location from here by clicling on the dropdown icon. After clicking on it you will get a list of villages. Choose the place where you live',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  leading: Icon(Icons.home,
                    color: Colors.blue[900],),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    'Home Visit',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' You can choose if your animal need home visit by a doctor or not',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  leading: Icon(Icons.pets,
                    color: Colors.blue[900],),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    'Emergency',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' If this is an emergency choose the emergency button',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  leading: Icon(Icons.home,
                    color: Colors.blue[900],),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    'Add and Notify Doctors',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' Click on this button to add your case.',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  leading: Icon(Icons.home,
                    color: Colors.blue[900],),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
