import 'package:flutter/material.dart';
import 'package:vet_app/english/cases.dart';
import 'package:vet_app/english/animallist.dart';
import 'package:vet_app/general/locationsLite.dart';
import 'package:vet_app/tamil/animalListNoAppbar2.dart';
import 'package:vet_app/tamil/casesNoAppbar.dart';
import 'package:vet_app/tamil/drawer.dart';
import 'package:vet_app/tamil/help.dart';

class tabManage2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Center(child: Text('முகப்புப்பக்கம்')),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.live_help),
                textColor: Colors.white,
                label: Text(
                  'உதவி',
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
                Tab(icon: Icon(Icons.library_books), text: "வழக்குகள்"),
                Tab(icon: Icon(Icons.pets), text: "விலங்குகள்s"),
                Tab(icon: Icon(Icons.location_on), text: "இடங்கள்")
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
