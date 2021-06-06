import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/docclass.dart';
import 'package:vetappvet/newcasetile.dart';

class EmergencyCasesList extends StatefulWidget {
  @override
  _EmergencyCasesListState createState() => _EmergencyCasesListState();
}

class _EmergencyCasesListState extends State<EmergencyCasesList> {
  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<List<CaseData>>(context) ?? [];
    final doctor = Provider.of<Doctor>(context);
    return ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          //print(index);
          //print(cases.length);
          String str = cases[index].doctor;
          String start = ",";
          final startIndex = str.indexOf(start) + 1;
          final endIndex = str.length;
          String docid = str.substring(startIndex, endIndex);
          //print(docid);
          if (docid == doctor.docid && cases[index].emergency == true) {
            return NewcaseTile(casestile: cases[index]);
          } else {
            return Container();
          }
        });
  }
}
