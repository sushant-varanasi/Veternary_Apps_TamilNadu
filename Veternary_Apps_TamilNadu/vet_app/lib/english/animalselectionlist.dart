import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/petbase.dart';
import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/english/petlist.dart';

class PetSelection extends StatefulWidget {
  @override
  _PetSelectionState createState() => _PetSelectionState();
}

class _PetSelectionState extends State<PetSelection> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<PetData>>.value(
        value: PetBaseService().Pets,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Select Animal'),
            backgroundColor: Colors.blue[900],
          ),
          body: PetList(),
        ));
  }
}
