import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/english/newLocation.dart';
import 'package:vet_app/english/newcase.dart';
import 'locationslist.dart';
import '../english/drawer.dart';
import 'loading2.dart';
import 'locationClass.dart';

class LocationsLite extends StatefulWidget {
  @override
  _LocationsLiteState createState() => _LocationsLiteState();
}

class _LocationsLiteState extends State<LocationsLite> {
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
              drawer: SideBar(),
              body: Container(
                  constraints: BoxConstraints.expand(),

                  child: LocationsList()),
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
