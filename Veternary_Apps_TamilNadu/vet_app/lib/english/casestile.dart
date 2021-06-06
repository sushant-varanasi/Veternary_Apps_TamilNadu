import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vet_app/english/Completedchoice.dart';
import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/english/casepage.dart';
import 'package:vet_app/english/docdetails.dart';
import 'package:vet_app/english/editpetcase.dart';

class CaseTile extends StatefulWidget {
  final CaseData casestile;
  CaseTile({this.casestile});
  @override
  _CaseTileState createState() => _CaseTileState();
}

class _CaseTileState extends State<CaseTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Container(
        child: Card(
          elevation: 5,
          shadowColor: Colors.blueGrey[100],
          color: (widget.casestile.status == 'Closed' ||
                  widget.casestile.status == 'Closed w/o Doctor')
              ? Colors.blueGrey[400]
              : Colors.white,
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              ListTile(
                title: Text(
                  /*'Instructions:  ' +
                    widget.casestile.instructions +*/
                  /*'\nSpecies: ' +*/
                  widget.casestile.species,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                subtitle: Text(
                  'Breed: ' +
                      widget.casestile.breed +
                      '\nStatus: ' +
                      widget.casestile.status,
                  style: TextStyle(
                      fontSize:
                          13), /*'\nDays since registered: ' +
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
                    widget.casestile.severityUser*/
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CasePage(casestile: widget.casestile)));
                },
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Doctordetails()));
                    },
                    icon: Icon(
                      Icons.local_hospital,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Doctor",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  FlatButton.icon(
                    label: Text(
                      "Finish",
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
                              backgroundColor: Colors.white70,
                              title: Text('Has Doctor Visited?'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(
                                            color: Colors.white70,
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
                                                          'Confirm Case Completion'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <Widget>[
                                                            Text(
                                                                'Is the case over WITH a doctor'),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          child: Text('Yes'),
                                                          onPressed: () {
                                                            var random =
                                                                new Random();
                                                            int OTP =
                                                                random.nextInt(
                                                                        899999) +
                                                                    100000;
                                                            CaseService(
                                                                    caseid: widget
                                                                        .casestile
                                                                        .caseid)
                                                                .OTPgen(OTP);
                                                            return showDialog<
                                                                    void>(
                                                                context:
                                                                    context,
                                                                barrierDismissible:
                                                                    false,
                                                                // user must tap button!
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    backgroundColor:
                                                                        Colors.white70,
                                                                    title: Text(
                                                                        'OTP'),
                                                                    content:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          ListBody(
                                                                        children: <
                                                                            Widget>[
                                                                          Center(
                                                                              child: Text('$OTP')),
                                                                          Text(
                                                                              'Share code this with Doctor'),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    actions: <
                                                                        Widget>[
                                                                      FlatButton(
                                                                        child: Text(
                                                                            'Done'),
                                                                        onPressed:
                                                                            () {
                                                                          CaseService(caseid: widget.casestile.caseid)
                                                                              .caseOver2();
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                });
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                        FlatButton(
                                                          child: Text('No'),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            }),
                                        SizedBox(height: 20),
                                        FlatButton(
                                          color: Colors.white70,
                                          child: Text('No'),
                                          onPressed: () => setState(() {
                                            return showDialog<void>(
                                              context: context,
                                              barrierDismissible: false,
                                              // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Confirm Case Over'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        Text(
                                                            'Is the case over WITHOUT a doctor'),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text('Yes'),
                                                      onPressed: () {
                                                        CaseService(
                                                                caseid: widget
                                                                    .casestile
                                                                    .caseid)
                                                            .caseOver();
                                                        Navigator.of(context)
                                                            .pop();

                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    FlatButton(
                                                      child: Text('No'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                      /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CompletedChoice(casedata: casestile)));

                             */
                    },
                  ),
                  FlatButton.icon(
                    label: Text(
                      "Update",
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Icon(
                      Icons.history,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditCase(casedata: widget.casestile)));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
