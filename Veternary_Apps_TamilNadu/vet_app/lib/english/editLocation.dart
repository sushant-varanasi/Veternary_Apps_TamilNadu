import 'package:flutter/material.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/general/textdecor.dart';

class EditLocation extends StatefulWidget {
  final LocationData loc;
  EditLocation({this.loc});
  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            //backgroundColor: Colors.transparent,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Colors.blue[900],
              elevation: 0.0,
              title: Text(
                'Edit Location',
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
                    Text('Name of Location'),
                    TextFormField(
                        textInputAction: TextInputAction.newline,
                        decoration: textInputDecoration.copyWith(
                            hintText: "Name of location eg.Home, Farm"),
                        //validator: (val) => val.isEmpty ? 'Status' : null,
                        initialValue: widget.loc.name,
                        onChanged: (val) {
                          if (val != "") setState(() => name = val);
                        }),
                    SizedBox(height: 20),
                    RaisedButton(
                        color: Colors.blue[900],
                        child: Text(
                          'Done',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          if (_formKey.currentState.validate()) {
                            await LocBaseService(locid: widget.loc.locid)
                                .updateLocData(name);
                          }
                        })
                  ],
                ),
              ),
            ),
          );
  }
}
