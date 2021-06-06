
import 'package:pinch_zoom/pinch_zoom.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'caseClass.dart';
import 'loading.dart';

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
          backgroundColor: Colors.black,
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
          child: Container(
            child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Card(
              margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                       'CaseID:  ' +
                      casestile.caseid +
                      '\n' +
                      'Instructions:  ' +
                          casestile.instructions +
                          '\n' +
                          'Pet ID: ' +
                          casestile.puid +
                          '\n' +
                          'Species: ' +
                          casestile.species +
                          '   \n  Breed: ' +
                          casestile.breed +
                          '\nStatus:  ' +
                          casestile.status,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
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
                          '\nComment:  ' +
                          casestile.comment,
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                /*leading: SizedBox(
                    height: 100.0,
                    width: 100.0, // fixed width and height
                    child: Image.network(casestile.imageurl)
                ),*/
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
        /*child: PinchZoom(
          image: Image.network(casestile.imageurl),
          zoomedBackgroundColor: Colors.black.withOpacity(0.5),
          resetDuration: const Duration(milliseconds: 100),
          maxScale: 2.5,
        ),*/
      ),
      //CaseInfoList(),
      /*floatingActionButton: FloatingActionButton(
              onPressed: () => setState(() {
               //np = true;
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditCase()));*/
              }),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.blue[900],
            ),

             */
    );
  }
}
