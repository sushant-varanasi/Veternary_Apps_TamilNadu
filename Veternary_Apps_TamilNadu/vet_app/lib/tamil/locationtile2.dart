import 'package:flutter/material.dart';

import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/tamil/editLocation.dart';

class LocationTile extends StatelessWidget {
  final LocationData locationtile;
  LocationTile({this.locationtile});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        elevation: 5,
        shadowColor: Colors.blueGrey[100],
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                locationtile.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                locationtile
                    .village /*+
                  '\nLatitude,Longitude: ' +
                  locationtile.position*/
                ,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              /* onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CasePage(casestile: casestile)));
              },*/
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton.icon(
                  label: Text(
                    "பெயரைத் திருத்து",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EditLocation(loc: locationtile)));
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
