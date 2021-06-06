import 'package:flutter/material.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/general/loading2.dart';
import 'package:vet_app/tamil/drawer.dart';

class CasePage extends StatefulWidget {
  final CaseData casestile;
  CasePage({this.casestile});

  @override
  _CasePageState createState() => _CasePageState(casestile: casestile);
}

class _CasePageState extends State<CasePage> {
  bool loading = false;
  final CaseData casestile;
  _CasePageState({this.casestile});
  //final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //final projdata = Provider.of<ProjData>(context);

    return loading
        ? Loading2()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue[900],
                elevation: 0.0,
                title: Text(
                  'வழக்கு விவரங்கள்',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.arrow_back),
                    textColor: Colors.white,
                    label: Text('Back'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ]),
            drawer: SideBar(),
            body: Container(
              constraints: BoxConstraints.expand(),
              child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Card(
                  margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            // 'CaseID:  ' +
                            //casestile.caseid +
                            //'\n' +

                            casestile.species + ': ' + casestile.description,

                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          subtitle: Text(
                            '\n\nBreed: ' +
                                casestile.breed +
                                '\n\n' +
                                'Pet ID: ' +
                                casestile.puid +
                                '\n\nStatus:  ' +
                                casestile.status +
                                '\n\nInstructions:  ' +
                                casestile.instructions +
                                '\n\nDays since registered: ' +
                                widget.casestile.days.toString() +
                                '\n\nEmergency:' +
                                casestile.emergency.toString() +
                                '\n\nLocation:  ' +
                                casestile.location +
                                '\n\nAppointment Date:  ' +
                                casestile.adate +
                                '\n\nRegistration Date: ' +
                                casestile.rdate +
                                '\n\nSeverity(doctor):  ' +
                                casestile.severityDoc +
                                '\n\nSeverity(you): ' +
                                casestile.severityUser +
                                '\n\nDoctor:  ' +
                                casestile.doctor +
                                '\n\nYear of Birth:  ' +
                                casestile.year +
                                '\n\nHomevisit:  ' +
                                casestile.homevisit.toString() +
                                '\n\nComment:  ' +
                                casestile.comment,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                          onTap: () {
                            //Navigator.push(context,
                            //MaterialPageRoute(builder: (context) => CasePage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
