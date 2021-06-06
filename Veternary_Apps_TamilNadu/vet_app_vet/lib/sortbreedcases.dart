import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/casetile2.dart';

class BreedCases extends StatefulWidget {
  final CaseData breed;
  BreedCases({this.breed});
  @override
  _BreedCasesState createState() => _BreedCasesState();
}

class _BreedCasesState extends State<BreedCases> {
  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<List<CaseData>>(context);
    return ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          if (cases[index].puid != widget.breed.puid &&
              cases[index].breed == widget.breed.breed) {
            return CaseTile2(casestile: cases[index]);
          } else {
            return Container();
          }
        });
  }
}
