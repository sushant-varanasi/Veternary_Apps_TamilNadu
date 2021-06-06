import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappvet/Emergencycaseslist.dart';
import 'package:vetappvet/casebase.dart';
import 'package:vetappvet/caseclass.dart';

class EmergencyCases extends StatefulWidget {
  @override
  _EmergencyCasesState createState() => _EmergencyCasesState();
}

class _EmergencyCasesState extends State<EmergencyCases> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CaseData>>.value(
      value: CaseService().Cases,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            constraints: BoxConstraints.expand(),
            child: EmergencyCasesList(),
          )),
    );
  }
}
