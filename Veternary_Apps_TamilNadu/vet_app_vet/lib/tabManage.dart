import 'package:flutter/material.dart';
import 'package:vetappvet/allcaseslist.dart';
import 'package:vetappvet/cases.dart';
import 'package:vetappvet/drawer.dart';
import 'package:vetappvet/emergencycases.dart';
import 'package:vetappvet/help.dart';
import 'package:vetappvet/locationlite.dart';

class tabManage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown[800],
            title: Center(child: Text('Doctor App Home')),
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

                Tab(icon: Icon(Icons.library_books), text: "Cases2"),
                Tab(icon: Icon(Icons.local_hospital), text: "Emergency"),
                Tab(icon: Icon(Icons.location_on), text: "Maps")
              ],
            ),
          ),
          drawer: SideBar(),
          body: TabBarView(
            children: [
              CasesLite(),
              AllCasesList(),
              EmergencyCases(),
              LocationLite(),
            ],
          ),
        ),
      ),
    );
  }
}
