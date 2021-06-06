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
  final List<String> severe = ['குறைந்த', 'இயல்பானது', 'உயர்', 'மிக அதிக'];

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
                'வழக்கைத் திருத்து',
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
                    Text('விளக்கம்'),
                    TextFormField(
                        textInputAction: TextInputAction.newline,
                        decoration: textInputDecoration.copyWith(),
                        //validator: (val) => val.isEmpty ? 'Animal' : null,
                        initialValue: widget.casedata.description,
                        onChanged: (val) {
                          if (val != "") setState(() => description = val);
                        }),
                    SizedBox(height: 20),
                    Text('தீவிரத்தன்மை பயனர் கொடுத்த'),
                    DropdownButtonFormField(
                      decoration: textInputDecoration,
                      hint: Text('தீவிரத்தன்மை'),
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
                    Text('வீட்டு வருகை தேவை'),
                    DropdownButtonFormField(
                      decoration: textInputDecoration,
                      hint: Text('ஹோம்விசிட் தேவையா?'),
                      value: homevisit,
                      items: bools.map((pet) {
                        return DropdownMenuItem(
                          value: pet,
                          child: pet
                              ? Text('முகப்பு வருகை தேவை')
                              : Text('வீட்டு வருகை தேவையில்லை'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => homevisit = val),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                        color: Colors.blue[900],
                        child: Text(
                          'வழக்கைத் திருத்து',
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
