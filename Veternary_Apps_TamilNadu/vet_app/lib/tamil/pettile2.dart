import 'package:flutter/material.dart';

import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/tamil/edithistory.dart';
import 'package:vet_app/tamil/petcases2.dart';

class PetTile extends StatelessWidget {
  final PetData pet;

  PetTile({this.pet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        elevation: 5,
        shadowColor: Colors.blueGrey[100],
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: Column(children: <Widget>[
          SizedBox(height: 15),
          ListTile(
            title: Text(
              pet.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            subtitle: Text(
              'இனப்பெருக்கம்: ' +
                  pet.breed +
                  '\nஇனங்கள்: ' +
                  pet.species /*+
                '\nYear: ' +
                pet.year +
                '\nAnimal ID: ' +
                pet.puid*/
              ,
              style: TextStyle(fontSize: 13),
            ),
            onTap: () {
              print(pet.puid);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PetCase(allinfoofpet: pet)));
            },
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton.icon(
                label: Text(
                  "திருத்து வரலாறு",
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
                          builder: (context) => EditHistory(
                                pet: pet,
                              )));
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
