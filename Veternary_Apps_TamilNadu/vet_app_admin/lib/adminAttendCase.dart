import 'package:flutter/material.dart';

import 'admincasebase.dart';
import 'caseClass.dart';
import 'constants.dart';
import 'loading.dart';


class AttendCase extends StatefulWidget {
  final CaseData casedata;
  AttendCase({this.casedata});
  @override
  _AttendCaseState createState() => _AttendCaseState();
}

class _AttendCaseState extends State<AttendCase> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String severityDoc;
  final List<bool> bools=[true,false];
  final List<String> severe = ['Low', 'Normal', 'High', 'Very High'];
  String comment="";
  bool homevisit;
  String Instructions="";

  @override
  Widget build(BuildContext context) {

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
          'Attend Case',
          style: TextStyle(color: Colors.white),
        ),
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
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Text('Comment to User'),
              TextFormField(
                  textInputAction: TextInputAction.newline,
                  decoration: textInputDecoration.copyWith(),
                  validator: (val) => val.isEmpty ? 'Enter Comment to User' : null,
                  initialValue: widget.casedata.comment,
                  onChanged: (val) {
                    if (val != "") setState(() => comment = val);
                  }),
              SizedBox(height: 20),
              Text('Instructions to Doctor'),
              TextFormField(
                  textInputAction: TextInputAction.newline,
                  decoration: textInputDecoration.copyWith(),
                  validator: (val) => val.isEmpty ? 'Enter Comment to User' : null,
                  initialValue: widget.casedata.instructions,
                  onChanged: (val) {
                    if (val != "") setState(() => Instructions = val);
                  }),
              SizedBox(height: 20),
              Text('Severity'),
              DropdownButtonFormField(
                decoration: textInputDecoration,
                validator: (val)=>val.isEmpty?'Choose Severity':null,
                hint: Text('Severity'),
                value: severityDoc,
                items: severe.map((sev) {
                  return DropdownMenuItem(
                    value: sev,
                    child: Text('$sev'),
                  );
                }).toList(),
                onChanged: (val) => setState(() => severityDoc = val),
              ),
              SizedBox(height: 20),
              Text('Home Visit Required'),
              DropdownButtonFormField(
                decoration: textInputDecoration,
                hint: Text('Homevisit required'),
                value: widget.casedata.homevisit,
                items: bools.map((pet) {
                  return DropdownMenuItem(
                    value: pet,
                    child: pet
                        ? Text('HomeVisit Required')
                        : Text('HomeVisit Not Required'),
                  );
                }).toList(),
                onChanged: (val) => setState(() => homevisit = val),
              ),
              SizedBox(height: 20),
              RaisedButton(
                  color: Colors.black,
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                    if (_formKey.currentState.validate()) {
                      severityDoc = severityDoc == ""
                          ? widget.casedata.severityUser
                          : severityDoc;
                      Instructions = Instructions == ""
                          ? widget.casedata.instructions
                          : Instructions;
                      comment =
                      comment == "" ? widget.casedata.status : comment;
                      homevisit = homevisit == null
                          ? widget.casedata.homevisit
                          : homevisit;
                      await AdminCaseService(caseid: widget.casedata.caseid)
                          .updateCaseDataDoc(severityDoc, comment,  homevisit, Instructions,widget.casedata.stat, widget.casedata.notif,);
                    }
  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
