import 'dart:math';
import 'package:flutter/material.dart';

import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/tamil/casepage2.dart';
import 'package:vet_app/tamil/docdetails.dart';
import 'package:vet_app/tamil/editpetcase.dart';

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
                  'இனப்பெருக்கம்: ' +
                      widget.casestile.breed +
                      '\nநிலை: ' +
                      widget.casestile.status,
                  style: TextStyle(fontSize: 13),
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
                      "மருத்துவர்",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  FlatButton.icon(
                    label: Text(
                      "பூச்சு",
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
                              title: Text('மருத்துவர் பார்வையிட்டார்?'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        FlatButton(
                                            color: Colors.white70,
                                            child: Text('ஆம்'),
                                            onPressed: () {
                                              return showDialog<void>(
                                                  context: context,
                                                  barrierDismissible:
                                                      false, // user must tap butt
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'வழக்கு முடிவை உறுதிப்படுத்தவும்'),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <Widget>[
                                                            Text(
                                                                'ஒரு டாக்டருடன் வழக்கு'),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        FlatButton(
                                                          child: Text('ஆம்'),
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
                                                                        Colors
                                                                            .white70,
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
                                                                              'இதை டாக்டருடன் பகிர்ந்து கொள்ளுங்கள்'),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    actions: <
                                                                        Widget>[
                                                                      FlatButton(
                                                                        child: Text(
                                                                            'முடிந்தது'),
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
                                                          child: Text('இல்லை'),
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
                                          child: Text('இல்லை'),
                                          onPressed: () => setState(() {
                                            return showDialog<void>(
                                              context: context,
                                              barrierDismissible: false,
                                              // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      'வழக்கு முடிவை உறுதிப்படுத்தவும்'),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        Text(
                                                            'ஒரு மருத்துவர் இல்லாமல் வழக்கு'),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text('ஆம்'),
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
                                                      child: Text('இல்லை'),
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
