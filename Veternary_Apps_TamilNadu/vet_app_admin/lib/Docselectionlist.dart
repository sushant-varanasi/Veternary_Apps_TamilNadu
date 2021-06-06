import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappadmin/caseBase.dart';
import 'package:vetappadmin/caseClass.dart';
import 'package:vetappadmin/constants.dart';
import 'package:vetappadmin/docclass.dart';
import 'package:vetappadmin/locale/doctorselectiontile.dart';

class DocSelectionlist extends StatefulWidget {
  final String caseid;
  DocSelectionlist({this.caseid});
  @override
  _DocSelectionlistState createState() => _DocSelectionlistState();
}

class _DocSelectionlistState extends State<DocSelectionlist> {
  @override
  Widget build(BuildContext context) {
    final doctors = Provider.of<List<Doctordata>>(context) ?? [];
    return ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DocSelectionTile(
            doctor: doctors[index],
            caseid: widget.caseid,
          );
        });
  }
}
