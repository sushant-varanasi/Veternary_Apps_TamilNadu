import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/Casechoice.dart';
import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/english/drawer.dart';
import 'package:vet_app/english/caseslist.dart';
import 'package:vet_app/general/loading2.dart';
import 'package:vet_app/english/newcase.dart';
import 'package:vet_app/general/auth.dart';

class Cases extends StatefulWidget {
  @override
  _CasesState createState() => _CasesState();
}

class _CasesState extends State<Cases> {
  bool loading = false;
  //final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CaseData>>.value(
      value: CaseService().Cases,
      child: loading
          ? Loading2()
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                title: Text(
                  'Cases',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue[900],
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    // tooltip: 'Add new entry',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              drawer: SideBar(),
              body: Container(
                  constraints: BoxConstraints.expand(),
                  child: CasesList()),
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
    );
  }
}
