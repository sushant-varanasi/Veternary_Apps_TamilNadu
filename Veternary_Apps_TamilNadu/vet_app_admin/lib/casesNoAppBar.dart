
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'caseBase.dart';
import 'caseClass.dart';
import 'caseList.dart';

class CasesLite extends StatefulWidget {
  final int tab;
  CasesLite({this.tab});
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
            constraints: BoxConstraints.expand(),
            child: CasesList(tab: widget.tab)),

      ),
    );
  }
}
