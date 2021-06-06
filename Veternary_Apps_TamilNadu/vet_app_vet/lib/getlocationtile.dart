import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/casepage.dart';

class GetLocationTile extends StatefulWidget {
  final CaseData casestile;
  GetLocationTile({this.casestile});
  @override
  _GetLocationTileState createState() => _GetLocationTileState();
}

class _GetLocationTileState extends State<GetLocationTile> {
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
            SizedBox(height: 15),
            ListTile(
              title: Text(
                  widget.casestile.species ,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              subtitle: Text(
              '\nBreed: ' +
                  widget.casestile.breed +
                  '\nStatus: ' +
                  widget.casestile.status+'\nEmergency: ' +
                  widget.casestile.emergency.toString() +
                  '\nAppointment Date: ' +
                  widget.casestile.adate +
                  '\nRegistration Date: ' +
                  widget.casestile.rdate +
                  '\nCase Id: ' +
                  widget.casestile.caseid +
                  '\nSeverity(doctor): ' +
                  widget.casestile.severityDoc +
                  '\nSeverity(you): ' +
                  widget.casestile.severityUser,
                style: TextStyle(
                    fontSize:
                    13),),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CasePage(casestile: widget.casestile)));
              },
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    Icons.directions,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Get Route",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed:(){ _launchURL(widget.casestile.position);},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(latlong) async {
  /*String lat;
  String lon;
  var string = latlong;
  var ll = string.split(",");

  lat = ll[0] ;
  lon = ll[2] ;*/

  var url = 'https://www.google.com/maps/search/?api=1&query='+ latlong;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
