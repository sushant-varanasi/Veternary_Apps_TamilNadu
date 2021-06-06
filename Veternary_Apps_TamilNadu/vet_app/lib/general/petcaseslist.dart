import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/english/casetile2.dart';

class PetCasesList extends StatefulWidget {
  final String puid;
  PetCasesList({this.puid});
  @override
  _PetCasesListState createState() => _PetCasesListState();
}

class _PetCasesListState extends State<PetCasesList> {
  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<List<CaseData>>(context);
    return ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          if (cases[index].puid == widget.puid) {
            return CaseTile2(casestile: cases[index]);
          } else {
            return Container();
          }
        });
  }
}
