import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/docclass.dart';
import 'package:vetappvet/getlocationtile.dart';

class AllCasesList extends StatefulWidget {
  @override
  _AllCasesListState createState() => _AllCasesListState();
}

class _AllCasesListState extends State<AllCasesList> {
  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<List<CaseData>>(context) ?? [];
    final doctor = Provider.of<Doctor>(context);
    return ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          // print(index);
          //print(cases.length);
          String str = cases[index].doctor;
          String start = ",";
          final startIndex = str.indexOf(start) + 1;
          final endIndex = str.length;
          String docid = str.substring(startIndex, endIndex);
          print(docid);
          print("archika");
          print(doctor.docid);
          if (docid == doctor.docid) {
            return GetLocationTile(casestile: cases[index]);
          } else {
            return Container();
          }
        });
  }
}
