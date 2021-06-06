import 'package:flutter/material.dart';
import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/general/textdecor.dart';

class EditDesc extends StatefulWidget {
  final CaseData casedata;
  EditDesc({this.casedata});
  @override
  _EditDescState createState() => _EditDescState(casedata: casedata);
}

class _EditDescState extends State<EditDesc> {
  final CaseData casedata;
  _EditDescState({this.casedata});
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String description = "";

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
                            description = description == ""
                                ? widget.casedata.description
                                : description;
                            await CaseService(caseid: casedata.caseid)
                                .updateDesc(description);
                          }
                        })
                  ],
                ),
              ),
            ),
          );
  }
}
