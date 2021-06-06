import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/general/Mylocationlist.dart';
import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/english/newLocation.dart';

class LocationSelectionList extends StatefulWidget {
  final String caselocation;
  LocationSelectionList({this.caselocation});
  @override
  _LocationSelectionListState createState() => _LocationSelectionListState();
}

class _LocationSelectionListState extends State<LocationSelectionList> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<LocationData>>.value(
      value: LocBaseService().Locations2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('இருப்பிடத்தைத் தேர்ந்தெடுக்கவும்'),
          backgroundColor: Colors.blue[900],
        ),
        body: MyLocationsList(),
      ),
    );
  }
}
