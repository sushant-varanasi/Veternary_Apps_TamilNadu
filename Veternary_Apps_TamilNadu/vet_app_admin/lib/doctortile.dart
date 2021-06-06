import 'package:flutter/material.dart';
import 'package:vetappadmin/docclass.dart';

class DoctorTile extends StatelessWidget {
  final Doctordata doctor;
  DoctorTile({this.doctor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        elevation: 5,
        shadowColor: Colors.blueGrey[100],
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(children: <Widget>[
          ListTile(
            title: Text(doctor.name),
            subtitle: Text(
              'Docid:' + doctor.docid + '\nMobile: ' + doctor.mobile,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }
}
