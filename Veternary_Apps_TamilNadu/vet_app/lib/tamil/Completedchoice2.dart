//import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';

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
          'வழக்கு மூடப்பட்டது',
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
                'ஒரு மருத்துவர் பார்வையிட்டாரா?',
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
                      child: Text('ஆம்'),
                      onPressed: () {
                        return showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap butt
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.blue[900],
                                title: Text(
                                  'வழக்கை உறுதிப்படுத்தவும்',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('ஒரு டாக்டருடன் வழக்கு'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('ஆம்'),
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
                                                    'முடிந்தது',
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
                                    child: Text('இல்லை'),
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
                    child: Text('இல்லை'),
                    onPressed: () => setState(() {
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('வழக்கை உறுதிப்படுத்தவும்'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('ஒரு மருத்துவர் இல்லாமல் வழக்கு'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('ஆம்'),
                                onPressed: () {
                                  CaseService(caseid: widget.casedata.caseid)
                                      .caseOver();
                                  Navigator.of(context).pop();
                                },
                              ),
                              FlatButton(
                                child: Text('இல்லை'),
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
