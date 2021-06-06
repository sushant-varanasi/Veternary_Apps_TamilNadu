import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vet_app/english/Completedchoice.dart';
import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/english/casepage.dart';
import 'package:vet_app/english/docdetails.dart';
import 'package:vet_app/english/editpetcase.dart';

class NotifTile extends StatefulWidget {
  final CaseData casestile;
  NotifTile({this.casestile});
  @override
  _NotifTileState createState() => _NotifTileState();
}

class _NotifTileState extends State<NotifTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        color: widget.casestile.noOfAnimals==1? ((widget.casestile.status == 'Closed' ||
            widget.casestile.status == 'Closed w/o Doctor')
            ? Colors.blue[100]
            : Colors.blue[300]):((widget.casestile.status == 'Closed' ||
            widget.casestile.status == 'Closed w/o Doctor')
            ? Colors.orange[100]
            : Colors.orange[300]),
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                  widget.casestile.breed
                  ),
              subtitle: Text('\n' +
                  widget.casestile.notif ),
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
