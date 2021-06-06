import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/english/newLocation.dart';
import 'package:vet_app/english/newcase.dart';
import '../general/locationslist.dart';
import 'drawer.dart';
import '../general/loading2.dart';
import '../general/locationClass.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  bool loading = false;
  //final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<LocationData>>.value(
      value: LocBaseService().Locations,
      child: loading
          ? Loading2()
          : Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                title: Text(
                  'Locations',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue[900],
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
              drawer: SideBar(),
              body: Container(
                  constraints: BoxConstraints.expand(), child: LocationsList()),
              floatingActionButton: FloatingActionButton(
                onPressed: () => setState(() {
                  //np = true;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => newLocation()));
                }),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue[900],
              ),
            ),
    );
  }
}
