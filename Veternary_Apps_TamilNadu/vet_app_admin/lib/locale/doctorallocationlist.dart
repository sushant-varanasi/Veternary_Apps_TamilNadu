import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:vetappadmin/Docselectionlist.dart';
import 'package:vetappadmin/caseClass.dart';
import 'package:vetappadmin/docbase.dart';
import 'package:vetappadmin/docclass.dart';

class DoctorAllocationList extends StatefulWidget {
  final String caseid;
  DoctorAllocationList({this.caseid});
  @override
  _DoctorAllocationListState createState() => _DoctorAllocationListState();
}

class _DoctorAllocationListState extends State<DoctorAllocationList> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Doctordata>>.value(
      value: DocbaseService().Doctors2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Allocate Doctor'),
          backgroundColor: Colors.blue[900],
        ),
        body: DocSelectionlist(caseid: widget.caseid),
      ),
    );
  }
}
