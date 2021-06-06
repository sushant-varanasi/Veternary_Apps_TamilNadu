import 'package:flutter/material.dart';
import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/tamil/petconfirm2.dart';

class MyPetsTile extends StatelessWidget {
  final PetData pet;
  MyPetsTile({this.pet});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(children: <Widget>[
          ListTile(
            title: Text(
              pet.species,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text(
              'பெயர்: ' + pet.name + '\nஇனப்பெருக்கம்: ' + pet.breed,
              style: TextStyle(color: Colors.black),
            ),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton.icon(
                label: Text(
                  "தேர்ந்தெடுக்கவும்",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.check,
                  color: Colors.black,
                ),
                color: Colors.blue[100],
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PetConfirm(
                          mypet: pet,
                        ),
                      ));
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
