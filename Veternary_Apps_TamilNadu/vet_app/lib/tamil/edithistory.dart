import 'package:flutter/material.dart';
import 'package:vet_app/general/loading.dart';
import 'package:vet_app/general/petbase.dart';
import 'package:vet_app/general/petclass.dart';

import 'package:vet_app/general/textdecor.dart';

class EditHistory extends StatefulWidget {
  final PetData pet;
  EditHistory({this.pet});
  @override
  _EditHistoryState createState() => _EditHistoryState();
}

class _EditHistoryState extends State<EditHistory> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String history = "";
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
                'வரலாற்றைத் திருத்து',
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
                    Text('வரலாறு',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    TextFormField(
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'வரலாறு'),
                        validator: (val) => val.isEmpty ? 'விலங்கு' : null,
                        initialValue: widget.pet.history,
                        onChanged: (val) {
                          if (val != "") setState(() => history = val);
                        }),
                    SizedBox(height: 20),
                    RaisedButton(
                        color: Colors.blue[900],
                        child: Text(
                          'வரலாற்றைத் திருத்து',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          if (_formKey.currentState.validate()) {
                            await PetBaseService(puid: widget.pet.puid)
                                .updatePetData(history);
                          }
                        })
                  ],
                ),
              ),
            ),
          );
  }
}
