import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappvet/casebase.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/pastcaseslist.dart';

class CasesLite extends StatefulWidget {
  @override
  _CasesLiteState createState() => _CasesLiteState();
}

class _CasesLiteState extends State<CasesLite> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CaseData>>.value(
      value: CaseService().Cases,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            constraints: BoxConstraints.expand(), child: PastCasesList()),
      ),
    );
  }
}
