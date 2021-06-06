import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/general/petcaseslist.dart';
import 'package:vet_app/general/petclass.dart';

class PetCase extends StatelessWidget {
  final PetData allinfoofpet;
  PetCase({this.allinfoofpet});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CaseData>>.value(
      value: CaseService().Cases2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'My Info',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: Column(
          children: <Widget>[
            Card(
              color: Colors.white,
            elevation: 5,
            shadowColor: Colors.blueGrey[100],
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 9),
                  ListTile(
                    title: Text(
                          allinfoofpet.species,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        '\nBreed: ' +
                            allinfoofpet.breed +
                            '\nPetID:  ' +
                            allinfoofpet.puid+
                        'Year of Birth: ' +
                            allinfoofpet.year +
                            '\nHistory: ' +
                            allinfoofpet.history,
                        style: TextStyle(
                            fontSize: 14,

                            color: Colors.black)),
                  ),
                  SizedBox(height: 9),
                ],
              ),
            ),
            Expanded(child: PetCasesList(puid: allinfoofpet.puid)),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
