import 'package:flutter/material.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/loading.dart';

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
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backgroundColor: Colors.brown[800],
                elevation: 0.0,
                title: Text(
                  'Case Details',
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
            //drawer: SideBar(),
            body: Container(
              constraints: BoxConstraints.expand(),
                child: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.blueGrey[100],
                  margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                              casestile.species,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('Pet ID: ' +
                            casestile.puid +
                            '\n' +'     Breed: ' +
                            casestile.breed +
                            '\nStatus:  ' +
                            casestile.status+
                          '\nDays since registered: ' +
                              widget.casestile.days.toString() +
                              '\nEmergency:' +
                              casestile.emergency.toString() +
                              '\nDescription:  ' +
                              casestile.description +
                              '\nLocation:  ' +
                              casestile.location +
                              '\nAppointment Date:  ' +
                              casestile.adate +
                              '\nRegistration Date: ' +
                              casestile.rdate +
                              '\nSeverity(doctor):  ' +
                              casestile.severityDoc +
                              '\nSeverity(you): ' +
                              casestile.severityUser +
                              '\nDoctor:  ' +
                              casestile.doctor +
                              '\nYear of Birth:  ' +
                              casestile.year +
                              '\nHomevisit:  ' +
                              casestile.homevisit.toString() +
                            casestile.instructions +
                            '\n' +
                              '\nComment:  ' +
                              casestile.comment,
                          style: TextStyle(fontSize: 13.0, color: Colors.black),
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
          );
  }
}
