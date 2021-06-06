//import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/english/addDummyPet.dart';
import 'package:vet_app/english/animalselectionlist.dart';
import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/english/newcase.dart';

class CompletedChoice extends StatefulWidget {
  final CaseData casedata;

  CompletedChoice({this.casedata});
  @override
  _CompletedChoiceState createState() => _CompletedChoiceState();
}

class _CompletedChoiceState extends State<CompletedChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Case Closed',
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
      body: Container(
        constraints: BoxConstraints.expand(),
               child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Has a doctor visited?',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      color: Colors.white24,
                      child: Text('Yes'),
                      onPressed: () {
                        return showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap butt
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.blue[900],
                                title: Text(
                                  'Confirm Case Completion',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('Is the case over WITH a doctor'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Yes'),
                                    color: Colors.white24,
                                    onPressed: () {
                                      var random = new Random();
                                      int OTP = random.nextInt(899999) + 100000;
                                      CaseService(
                                              caseid: widget.casedata.caseid)
                                          .OTPgen(OTP);
                                      return showDialog<void>(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.blue[900],
                                              title: Text(
                                                'OTP',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Center(
                                                        child: Text(
                                                      '$OTP',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  color: Colors.blue[900],
                                                  child: Text(
                                                    'Done',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    CaseService(
                                                            caseid: widget
                                                                .casedata
                                                                .caseid)
                                                        .caseOver2();
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
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
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm Case Over'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Is the case over WITHOUT a doctor'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Yes'),
                                onPressed: () {
                                  CaseService(caseid: widget.casedata.caseid)
                                      .caseOver();
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.of(context).pop();
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
      ),
    );
  }
}
