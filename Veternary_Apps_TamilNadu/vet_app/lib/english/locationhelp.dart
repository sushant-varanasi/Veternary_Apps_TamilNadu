import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import '../general/loading2.dart';

class LocationHelp extends StatefulWidget {
  @override
  _LocationHelpState createState() => _LocationHelpState();
}

class _LocationHelpState extends State<LocationHelp> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //final projdata = Provider.of<ProjData>(context);

    return loading
        ? Loading2()
        : Scaffold(
      backgroundColor: Colors.transparent,
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
      drawer: SideBar(),
      body: Container(
        constraints: BoxConstraints.expand(),

        child: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    '\nSteps to add your current location',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '\n\nClick on the button \"Click to take current location\" for helping us know your exact location in coordinates.\nPlease allow phone to take location.\n\nYou need to type your city/town/village in 2nd box.\nAutomatic suggestions also appear. \n\nJust name your location in third box.\nIt can be home,farm,etc.\n\nClick on the final \"Add new location\" button to continue.',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  onTap: () {
                    //Navigator.push(context,
                    //MaterialPageRoute(builder: (context) => CasePage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
