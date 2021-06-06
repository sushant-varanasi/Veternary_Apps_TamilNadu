import 'package:flutter/material.dart';

import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/tamil/ConfirmCase2.dart';

class MyLocationTile extends StatefulWidget {
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
  final LocationData locationtile;
  final int noOfAnimals;
  MyLocationTile(
      {this.locationtile,
      this.uid,
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
  _MyLocationTileState createState() => _MyLocationTileState();
}

class _MyLocationTileState extends State<MyLocationTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        color: Colors.blue[900],
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                widget.locationtile.name,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                widget.locationtile.village +
                    '\nLatitude,Longitude:' +
                    widget.locationtile.position +
                    '\nLocationID: ' +
                    widget.locationtile.locid,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton.icon(
                  label: Text(
                    "தேர்ந்தெடுக்கவும்",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  icon: Icon(
                    Icons.check,
                    color: Colors.black,
                  ),
                  color: Colors.white,
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmCase(
                                position: widget.locationtile.position,
                                location: widget.locationtile.locid,
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
                                noOfAnimals: widget.noOfAnimals)));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
