import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/english/addpetdata.dart';
import 'package:vet_app/general/animals.dart';
import 'package:vet_app/general/petbase.dart';
import 'package:vet_app/general/petclass.dart';

class AnimalListLite extends StatefulWidget {
  @override
  _AnimalListLiteState createState() => _AnimalListLiteState();
}

class _AnimalListLiteState extends State<AnimalListLite> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PetData>>.value(
        value: PetBaseService().Pets,
        child: Scaffold(
            body: Animals(),
            floatingActionButton: FloatingActionButton(
              onPressed: () => setState(() {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AddPet()));
              }),
              child: Icon(Icons.add),
              backgroundColor: Colors.blue[900],
            )));
  }
}
