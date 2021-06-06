import 'package:flutter/material.dart';
import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/general/textdecor.dart';

class EditCase extends StatefulWidget {
  final CaseData casedata;
  EditCase({this.casedata});
  @override
  _EditCaseState createState() => _EditCaseState(casedata: casedata);
}

class _EditCaseState extends State<EditCase> {
  final CaseData casedata;
  _EditCaseState({this.casedata});
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String severity;
  String description = "";
  String status = "";
  final List<String> severe = ['Low', 'Normal', 'High', 'Very High'];

  bool homevisit = null;
  final List<bool> bools = [true, false];

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Colors.blue[900],
              elevation: 0.0,
              title: Text(
                'Edit Case',
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
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text('Description'),
                    TextFormField(
                        textInputAction: TextInputAction.newline,
                        decoration: textInputDecoration.copyWith(),
                        //validator: (val) => val.isEmpty ? 'Animal' : null,
                        initialValue: widget.casedata.description,
                        onChanged: (val) {
                          if (val != "") setState(() => description = val);
                        }),
                    SizedBox(height: 20),
                    Text('Severity by User'),
                    DropdownButtonFormField(
                      decoration: textInputDecoration,
                      hint: Text('Severity'),
                      value: severity == null
                          ? widget.casedata.severityUser
                          : severity,
                      items: severe.map((sev) {
                        return DropdownMenuItem(
                          value: sev,
                          child: Text('$sev'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => severity = val),
                    ),
                    SizedBox(height: 20),
                    Text('Home Visit Required'),
                    DropdownButtonFormField(
                      decoration: textInputDecoration,
                      hint: Text('Is Homevisit Required?'),
                      value: homevisit,
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
                        color: Colors.blue[900],
                        child: Text(
                          'Edit Case',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          if (_formKey.currentState.validate()) {
                            severity = severity == ""
                                ? widget.casedata.severityUser
                                : severity;
                            description = description == ""
                                ? widget.casedata.description
                                : description;
                            status =
                                status == "" ? widget.casedata.status : status;
                            homevisit = homevisit == null
                                ? widget.casedata.homevisit
                                : homevisit;
                            await CaseService(caseid: casedata.caseid)
                                .updateCaseDataUser(widget.casedata.stat,
                                    severity, description, homevisit);
                          }
                        })
                  ],
                ),
              ),
            ),
          );
  }
}
