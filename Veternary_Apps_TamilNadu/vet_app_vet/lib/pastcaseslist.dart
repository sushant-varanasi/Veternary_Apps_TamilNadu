import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/docclass.dart';
import 'package:vetappvet/newcasetile.dart';

class PastCasesList extends StatefulWidget {
  @override
  _PastCasesListState createState() => _PastCasesListState();
}

class _PastCasesListState extends State<PastCasesList> {
  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<List<CaseData>>(context) ?? [];
    final doctor = Provider.of<Doctor>(context);
    return ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          String str = cases[index].doctor;
          String start = ",";
          final startIndex = str.indexOf(start) + 1;
          final endIndex = str.length;
          String docid = str.substring(startIndex, endIndex);
          //print(docid);
          if (docid == doctor.docid) {
            return NewcaseTile(casestile: cases[index]);
          } else {
            return Container();
          }
        });
  }
}
/*String str = currentdate;
final startIndex = 0;
String end = "-";
final endIndex = str.indexOf(end) - 1;
String date = str.substring(startIndex, endIndex);
final startIndex2 =  str.indexOf(end) + 1;
String end2 = "-";
final endIndex2 = str.indexOf(end2) - 1;
String month = str.substring(startIndex2, endIndex2);
final startIndex3 =  str.indexOf(end2) + 1;
final endIndex3 = str.length;
String year = str.substring(startIndex3, endIndex3);*/


