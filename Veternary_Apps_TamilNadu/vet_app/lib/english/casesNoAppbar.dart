import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/Casechoice.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/english/animalselectionlist.dart';
import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/english/drawer.dart';
import 'package:vet_app/english/caseslist.dart';

class CasesLite extends StatefulWidget {
  @override
  _CasesLiteState createState() => _CasesLiteState();
}

class _CasesLiteState extends State<CasesLite> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CaseData>>.value(
      value: CaseService().Cases,
      child: Container(

        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              constraints: BoxConstraints.expand(), child: CasesList()),
          floatingActionButton: FloatingActionButton(
            onPressed: () => setState(() {
              //np = true;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CaseChoice()));
            }),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue[900],
          ),
        ),
      ),
    );
  }
}
