import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/english/pettile.dart';
import 'package:vet_app/general/user.dart';

class Animals extends StatefulWidget {
  @override
  _AnimalsState createState() => _AnimalsState();
}

class _AnimalsState extends State<Animals> {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);
    final pets = Provider.of<List<PetData>>(context) ?? [];

    pets.forEach((pet) {
      print(pet.name);
    });
    return ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return pets[index].uid == user2.uid
              ? PetTile(pet: pets[index])
              : Container();
        });
  }
}
