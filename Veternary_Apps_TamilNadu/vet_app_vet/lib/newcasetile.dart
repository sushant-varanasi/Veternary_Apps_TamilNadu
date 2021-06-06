import 'package:flutter/material.dart';
import 'package:vetappvet/casebase.dart';
import 'package:vetappvet/caseclass.dart';
import 'package:vetappvet/casepage.dart';
import 'package:vetappvet/constants.dart';
import 'package:vetappvet/pastcases.dart';
import 'package:vetappvet/similarbreedcases.dart';

class NewcaseTile extends StatefulWidget {
  final CaseData casestile;
  NewcaseTile({this.casestile});
  @override
  _NewcaseTileState createState() => _NewcaseTileState();
}

class _NewcaseTileState extends State<NewcaseTile> {
  final _formKey = GlobalKey<FormState>();
  String OTP='';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        elevation: 5,
        shadowColor: Colors.blueGrey[100],
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 15),
            ListTile(
              title: Text(
                  widget.casestile.species ),
              subtitle: Text(
                  '\nBreed: ' +
                      widget.casestile.breed +
                      '\nStatus: ' +
                      widget.casestile.status+
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
                  widget.casestile.instructions ),
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
                  icon: Icon(
                    Icons.supervisor_account,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Similar Breed Cases",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SamebreedCases(
                                  cases: widget.casestile,
                                )));
                  },
                ),
                SizedBox(width: 15.0),
                FlatButton.icon(
                  icon: Icon(
                    Icons.history,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Past Cases",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PastCases(
                                  puid: widget.casestile.puid,
                                )));
                  },
                ),
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
                            backgroundColor: Colors.blue[300],
                            title: Text('Has Case been completed?'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      FlatButton(
                                          color: Colors.blue[200],
                                          child: Text('Yes'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(context,MaterialPageRoute(
                                                builder: (context) => Scaffold(
                                                  appBar: AppBar(title:Text('Enter OTP')),
                                                  body: ListView(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                                                        child: Form(
                                                          key: _formKey,
                                                          child: Column(
                                                            children: <Widget>[
                                                              TextFormField(
                                                                  decoration: textInputDecoration.copyWith(
                                                                      hintText: 'Enter OTP',

                                                                      hoverColor: Colors.blue[900],
                                                                      fillColor: Colors.brown[50]),
                                                                  validator: (val) =>
                                                                  val!=widget.casestile.OTP.toString() ? 'Enter correct OTP' : null,
                                                                  onChanged: (val) {
                                                                    setState(() => OTP = val);
                                                                  }),
                                                              Card(
                                                                  color: Colors.blue[900],
                                                                  margin: EdgeInsets.symmetric(
                                                                      vertical: 10.0, horizontal: 25.0),
                                                                  child: ListTile(
                                                                    title: Center(
                                                                      child: Text(
                                                                        'Confirm',
                                                                        style: TextStyle(
                                                                          fontSize: 18.0,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    onTap: () async {
                                                                      if (_formKey.currentState.validate()) {
                                                                        print(widget.casestile.OTP.toString()+OTP.toString());
                                                                        CaseService(caseid:widget.casestile.caseid).OTPver(OTP,widget.casestile.OTP.toString());
                                                                        Navigator.pop(context);
                                                                      }

                                                                    },
                                                                  )),

                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )));


}),
                                      SizedBox(height: 20),
                                      FlatButton(
                                        color: Colors.blue[100],
                                        child: Text('No'),
                                        onPressed: (){
                                            Navigator.pop(context);
                                        }),

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

                    /*
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.brown[200],
                          title: Text('Enter OTP'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Form(
                                      key: _formKey,
                                      child: ListView(
                                        children: <Widget>[
                                          TextFormField(
                                              textInputAction:
                                                  TextInputAction.newline,
                                              //decoration: textInputDecoration
                                              // .copyWith(),
                                              validator: (val) => val.isEmpty
                                                  ? 'Enter OTP'
                                                  : (val != widget.casestile.OTP
                                                      ? 'You Entered wrong OTP'
                                                      : null),
                                              onChanged: (val) {
                                                if (val != "")
                                                  setState(() => otp = val);
                                              }),
                                          RaisedButton(
                                            color: Colors.brown[800],
                                            child: Text(
                                              'Done',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            /*onPressed: () async {
                                                Navigator.pop(context);
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  await CaseService(
                                                          caseid: widget
                                                              .casestile.caseid)
                                                      .confirmOTP();
                                                }
                                              }*/


                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );


                      },
                    );
              */
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
