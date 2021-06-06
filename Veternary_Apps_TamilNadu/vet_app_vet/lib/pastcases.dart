import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappvet/casebase.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/docclass.dart';
import 'package:vetappvet/petcaseslist.dart';

class PastCases extends StatefulWidget {
  final String puid;
  PastCases({this.puid});
  @override
  _PastCasesState createState() => _PastCasesState();
}

class _PastCasesState extends State<PastCases> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CaseData>>.value(
      value: CaseService().Cases,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'Past Cases',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.brown[800],
        ),
        body: Column(
          children: <Widget>[Expanded(child: PetCasesList(puid: widget.puid))],
        ),
      ),
    );
  }
}
