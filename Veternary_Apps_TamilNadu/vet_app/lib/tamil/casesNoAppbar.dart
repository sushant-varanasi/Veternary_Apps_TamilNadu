import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/tamil/Casechoice2.dart';
import 'package:vet_app/tamil/caselist2.dart';

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
                  MaterialPageRoute(builder: (context) => CaseChoice2()));
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
