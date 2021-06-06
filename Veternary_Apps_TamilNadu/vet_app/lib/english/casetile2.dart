import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/english/casepage.dart';
import 'package:vet_app/english/editpetcase.dart';

class CaseTile2 extends StatefulWidget {
  final CaseData casestile;
  CaseTile2({this.casestile});
  @override
  _CaseTile2State createState() => _CaseTile2State();
}

class _CaseTile2State extends State<CaseTile2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        color: (widget.casestile.status == 'Closed' ||
                widget.casestile.status == 'Closed w/o Doctor')
            ? Colors.blue[100]
            : Colors.blue[300],
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Instructions:  ' + widget.casestile.instructions),
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
                  widget.casestile.severityUser),
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
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.blue[300],
                                  title: Text('Has Doctor Visited?'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            FlatButton(
                                                color: Colors.blue[200],
                                                child: Text('Yes'),
                                                onPressed: () {
                                                  return showDialog<void>(
                                                      context: context,
                                                      barrierDismissible:
                                                          false, // user must tap butt
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Confirm Case Completion'),
                                                          content:
                                                              SingleChildScrollView(
                                                            child: ListBody(
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    'Is the case over WITH a doctor'),
                                                              ],
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            FlatButton(
                                                              child:
                                                                  Text('Yes'),
                                                              onPressed: () {
                                                                var random =
                                                                    new Random();
                                                                int OTP = random
                                                                        .nextInt(
                                                                            899999) +
                                                                    100000;
                                                                CaseService(
                                                                        caseid: widget
                                                                            .casestile
                                                                            .caseid)
                                                                    .OTPgen(
                                                                        OTP);
                                                                return showDialog<
                                                                        void>(
                                                                    context:
                                                                        context,
                                                                    barrierDismissible:
                                                                        false, // user must tap button!
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return AlertDialog(
                                                                        backgroundColor:
                                                                            Colors.blue[300],
                                                                        title: Text(
                                                                            'OTP'),
                                                                        content:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              ListBody(
                                                                            children: <Widget>[
                                                                              Center(child: Text('$OTP')),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        actions: <
                                                                            Widget>[
                                                                          FlatButton(
                                                                            child:
                                                                                Text('Done'),
                                                                            onPressed:
                                                                                () {
                                                                              CaseService(caseid: widget.casestile.caseid).caseOver2();
                                                                              Navigator.of(context).pop();
                                                                              Navigator.of(context).pop();
                                                                              Navigator.of(context).pop();
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
                                              color: Colors.blue[100],
                                              child: Text('No'),
                                              onPressed: () => setState(() {
                                                return showDialog<void>(
                                                  context: context,
                                                  barrierDismissible:
                                                      false, // user must tap button!
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Confirm Case Over'),
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
                                                            Navigator.of(
                                                                    context)
                                                                .pop();

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
                          "Edit Case",
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
    );
  }
}
