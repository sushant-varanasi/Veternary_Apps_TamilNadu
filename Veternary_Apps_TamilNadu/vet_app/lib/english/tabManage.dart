import 'package:flutter/material.dart';
import 'package:vet_app/english/cases.dart';
import 'package:vet_app/english/animallist.dart';
import 'package:vet_app/english/casesNoAppbar.dart';
import 'package:vet_app/english/drawer.dart';
import 'package:vet_app/english/animalListNoAppbar.dart';
import 'package:vet_app/english/help.dart';
import 'package:vet_app/general/locationsLite.dart';

class tabManage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Center(child: Text('Vet App Home')),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.live_help),
                textColor: Colors.white,
                label: Text(
                  'HELP',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Help()));
                },
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.white60,
              labelColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.library_books), text: "Cases"),
                Tab(icon: Icon(Icons.pets), text: "Animals"),
                Tab(icon: Icon(Icons.location_on), text: "Locations")
              ],
            ),
          ),
          drawer: SideBar(),
          body: TabBarView(
            children: [
              CasesLite(),
              AnimalListLite(),
              LocationsLite(),
            ],
          ),
        ),
      ),
    );
  }
}
