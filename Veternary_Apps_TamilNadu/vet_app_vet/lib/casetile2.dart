import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vetappvet/casebase.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/casepage.dart';
import 'package:vetappvet/constants.dart';

class CaseTile2 extends StatefulWidget {
  final CaseData casestile;
  CaseTile2({this.casestile});
  @override
  _CaseTile2State createState() => _CaseTile2State();
}

class _CaseTile2State extends State<CaseTile2> {
  final _formKey = GlobalKey<FormState>();
  int OTP;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        elevation: 5,
        shadowColor: Colors.blueGrey[100],
        color: (widget.casestile.status == 'Closed' ||
                widget.casestile.status == 'Closed w/o Doctor')
            ? Colors.white12
            : Colors.white70,
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(children: <Widget>[
          SizedBox(height: 15),
          ListTile(
            title: Text( widget.casestile.instructions, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
            subtitle: Text('\nEmergency: ' +
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
                widget.casestile.severityUser,style: TextStyle(
                fontSize:
                13),),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CasePage(casestile: widget.casestile)));
            },
          ),
          (widget.casestile.status == 'Closed' ||
                  widget.casestile.status == 'Closed w/o Doctor')
              ? Container()
              : ButtonBar(
                  children: <Widget>[
                    FlatButton.icon(
                      label: Text(
                        "Case Completed/Over",
                        style: TextStyle(color: Colors.black),
                      ),
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        return showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.brown[800],
                                title: Text('Has case been completed?'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          FlatButton(
                                              color: Colors.brown[400],
                                              child: Text('Yes'),
                                              onPressed: () {
                                                return showDialog<void>(
                                                  context: context,
                                                  barrierDismissible:
                                                      false, // user must tap butt
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Enter OTP from User'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <Widget>[
                                                            Form(
                                                              key: _formKey,
                                                              child: ListView(
                                                                children: <
                                                                    Widget>[
                                                                  TextFormField(
                                                                      decoration: textInputDecoration.copyWith(
                                                                          hintText:
                                                                              'Enter OTP from user',
                                                                          hoverColor: Colors.blue[
                                                                              900],
                                                                          fillColor: Colors.brown[
                                                                              50]),
                                                                      validator: (val) => val
                                                                              .isEmpty
                                                                          ? 'Enter an OTP'
                                                                          : null,
                                                                      onChanged:
                                                                          (val) {
                                                                        setState(() =>
                                                                            OTP =
                                                                                val as int);
                                                                      }),
                                                                  FlatButton(
                                                                      child: Text(
                                                                          'Confirm OTP'),
                                                                      onPressed:
                                                                          () {
                                                                        CaseService(caseid: widget.casestile.caseid).OTPver(
                                                                            OTP,
                                                                            widget.casestile.OTP);
                                                                      }),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).pop();
                                                  },
                                                );
                                              }),
                                        ],
                                      ),
                                      FlatButton(
                                        child: Text('No'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
        ]),
      ),
    );
    /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CompletedChoice(casedata: casestile)));

                           */
  }
}
