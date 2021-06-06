import 'package:flutter/material.dart';
import 'package:vetappadmin/admincasebase.dart';
import 'package:vetappadmin/docclass.dart';

class DocSelectionTile extends StatefulWidget {
  final Doctordata doctor;
  final String caseid;
  DocSelectionTile({this.doctor, this.caseid});
  @override
  _DocSelectionTileState createState() => _DocSelectionTileState();
}

class _DocSelectionTileState extends State<DocSelectionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(children: <Widget>[
          ListTile(
            title: Text('Name: ' +
                widget.doctor.name +
                '\nDocID: ' +
                widget.doctor.docid),
            /* subtitle: Text('Speciality'+widget.doctor.speciality
        +'\nRating'+widget.doctor.rating
        +'\nlocality' + widget.doctor.locality
              ,
              style: TextStyle(color: Colors.black),
            ),*/
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton.icon(
                label: Text(
                  "Select",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.check,
                  color: Colors.black,
                ),
                color: Colors.blue[100],
                onPressed: () async {
                  await AdminCaseService(caseid: widget.caseid)
                      .allocateDoc(widget.doctor.docid, widget.doctor.name);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
