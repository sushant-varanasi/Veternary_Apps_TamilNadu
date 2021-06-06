import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/general/user.dart';
import 'casestile.dart';

class CasesList extends StatefulWidget {
  @override
  _CasesListState createState() => _CasesListState();
}

class _CasesListState extends State<CasesList> {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);
    final cases = Provider.of<List<CaseData>>(context) ?? [];

    return ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          print(index);
          print(cases.length);

          return cases[index].uid == user2.uid
              ? CaseTile(casestile: cases[index])
              : Container();
        });
  }
}
