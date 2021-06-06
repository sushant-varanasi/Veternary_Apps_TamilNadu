import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappvet/casebase.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/sortbreedcases.dart';

class SamebreedCases extends StatefulWidget {
  final CaseData cases;
  SamebreedCases({this.cases});
  @override
  _SamebreedCasesState createState() => _SamebreedCasesState();
}

class _SamebreedCasesState extends State<SamebreedCases> {
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
            'Prev. Cases in this Breed',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.brown[800],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: BreedCases(
              breed: widget.cases,
            ))
          ],
        ),
      ),
    );
  }
}
