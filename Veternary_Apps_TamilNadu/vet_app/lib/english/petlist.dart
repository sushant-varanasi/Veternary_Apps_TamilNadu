import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/english/mypetstile.dart';
import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/general/user.dart';

class PetList extends StatefulWidget {
  @override
  _PetListState createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);
    final pets = Provider.of<List<PetData>>(context) ?? [];
    return ListView.builder(
        itemCount: pets.length,
        itemBuilder: (context, index) {
          return pets[index].uid == user2.uid
              ? MyPetsTile(pet: pets[index])
              : Container();
        });
  }
}
