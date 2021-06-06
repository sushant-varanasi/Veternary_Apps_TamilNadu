import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/english/casepage.dart';
import 'package:vet_app/english/editpetcase.dart';

class CaseTile_2 extends StatefulWidget {
  final CaseData casestile;
  CaseTile_2({this.casestile});
  @override
  _CaseTile_2State createState() => _CaseTile_2State();
}

class _CaseTile_2State extends State<CaseTile_2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        elevation: 5,
        shadowColor: Colors.blueGrey[100],
        color: (widget.casestile.status == 'Closed' ||
                widget.casestile.status == 'Closed w/o Doctor')
            ? Colors.yellow[100]
            : Colors.yellow[300],
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                widget.casestile.species,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              subtitle: Text('\nBreed: ' +
                  widget.casestile.breed +
                  '\nStatus: ' +
                  widget.casestile.status+
                  '\nDays since registered: ' +
                  widget.casestile.days.toString() +
                  '\nEmergency: ' +
                  widget.casestile.emergency.toString() +
                  '\nAppointment Date: ' +
                  widget.casestile.adate +
                  '\nRegistration Date: ' +
                  widget.casestile.rdate +
                  '\nCase Id: ' +
                  widget.casestile.caseid +
                  '\nSeverity(doctor): ' +
                  widget.casestile.severityDoc +
                  '\nSeverity(you): ' +
                  widget.casestile.severityUser+
                  'Instructions:  ' +
                  widget.casestile.instructions,
                style: TextStyle(
                    fontSize:
                    13), ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CasePage(casestile: widget.casestile)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
