import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vet_app/general/animals.dart';
import 'package:vet_app/general/petbase.dart';
import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/tamil/addpetdata2.dart';
import 'package:vet_app/tamil/drawer.dart';

class AnimalList extends StatefulWidget {
  @override
  _AnimalListState createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PetData>>.value(
        value: PetBaseService().Pets,
        child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                'என் விலங்கு',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue[900],
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
            drawer: SideBar(),
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
