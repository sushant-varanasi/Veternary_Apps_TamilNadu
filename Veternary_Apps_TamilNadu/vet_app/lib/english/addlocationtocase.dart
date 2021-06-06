import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/general/Mylocationlist.dart';
import 'package:vet_app/english/drawer.dart';
import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/english/newLocation.dart';

class AddLoctoCase extends StatefulWidget {
  final String uid;
  final String imageurl;
  final String puid;
  final String species;
  final String breed;
  final String severity;
  final String about;
  final String year;
  final String finalDate;
  final bool homevisit;
  final bool emergency;
  final int noOfAnimals;
  AddLoctoCase(
      {this.uid,
      this.imageurl,
      this.puid,
      this.species,
      this.breed,
      this.severity,
      this.about,
      this.year,
      this.finalDate,
      this.homevisit,
      this.emergency,
      this.noOfAnimals});
  @override
  _AddLoctoCaseState createState() => _AddLoctoCaseState();
}

class _AddLoctoCaseState extends State<AddLoctoCase> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<LocationData>>.value(
      value: LocBaseService().Locations2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'Add Case Location',
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
        body: MyLocationsList(
          uid: widget.uid,
          imageurl: widget.imageurl,
          puid: widget.puid,
          species: widget.species,
          breed: widget.breed,
          severity: widget.severity,
          about: widget.about,
          year: widget.year,
          finalDate: widget.finalDate,
          homevisit: widget.homevisit,
          emergency: widget.emergency,
          noOfAnimals: widget.noOfAnimals,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
            //np = true;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => newLocation()));
          }),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue[900],
        ),
      ),
    );
  }
}
