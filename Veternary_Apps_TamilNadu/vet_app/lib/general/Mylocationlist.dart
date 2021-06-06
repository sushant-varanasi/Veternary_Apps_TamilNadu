import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/english/confirmlocationtile.dart';
import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/general/user.dart';

import 'locationClass.dart';

class MyLocationsList extends StatefulWidget {
  final String uid;
  final String imageurl;
  final String puid;
  final String species;
  final String breed;
  final String severity;
  final String about;
  final String year;
  final String finalDate;
  final bool homevisit;
  final bool emergency;
  final int noOfAnimals;
  MyLocationsList(
      {this.uid,
      this.imageurl,
      this.puid,
      this.species,
      this.breed,
      this.severity,
      this.about,
      this.year,
      this.finalDate,
      this.homevisit,
      this.emergency,
      this.noOfAnimals});
  @override
  _MyLocationslistState createState() => _MyLocationslistState();
}

class _MyLocationslistState extends State<MyLocationsList> {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);
    final location = Provider.of<List<LocationData>>(context) ?? [];

    return ListView.builder(
        itemCount: location.length,
        itemBuilder: (context, index) {
          print(index);
          print(location.length);

          return location[index].uid == user2.uid
              ? MyLocationTile(
                  locationtile: location[index],
                  uid: widget.uid,
                  imageurl: widget.imageurl,
                  puid: widget.puid,
                  species: widget.species,
                  breed: widget.breed,
                  severity: widget.severity,
                  about: widget.about,
                  year: widget.year,
                  finalDate: widget.finalDate,
                  homevisit: widget.homevisit,
                  emergency: widget.emergency,
                  noOfAnimals: widget.noOfAnimals) //confirmlocationtile
              : Container();
        });
  }
}
