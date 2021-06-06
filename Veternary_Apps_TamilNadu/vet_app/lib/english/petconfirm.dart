import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/english/addimagepage.dart';
import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/english/newcase.dart';
import 'package:vet_app/general/petclass.dart';

class PetConfirm extends StatefulWidget {
  final PetData mypet;
  PetConfirm({this.mypet});
  @override
  _PetConfirmState createState() => _PetConfirmState();
}

class _PetConfirmState extends State<PetConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Pet'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shadowColor: Colors.blueGrey[100],
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(children: <Widget>[
            SizedBox(height: 100),
            ListTile(
              title: Text('Name: ' + widget.mypet.name,
                  style: TextStyle(fontSize: 23.0, color: Colors.black)),
              subtitle: Text(
                'Breed: ' +
                    widget.mypet.breed +
                    '\nSpecies: ' +
                    widget.mypet.species +
                    '\nPetID:' +
                    widget.mypet.puid,
                style: TextStyle(fontSize: 23.0, color: Colors.black),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton.icon(
                  label: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  icon: Icon(
                    Icons.history,
                    color: Colors.black,
                  ),
                  color: Colors.blue[100],
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddImage(petcase: widget.mypet,i:0),
                        ));
                  },
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
