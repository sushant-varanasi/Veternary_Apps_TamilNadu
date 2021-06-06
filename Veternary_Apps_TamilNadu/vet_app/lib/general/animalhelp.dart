import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../english/drawer.dart';
import 'loading2.dart';

class AnimalHelp extends StatefulWidget {
  @override
  _AnimalHelpState createState() => _AnimalHelpState();
}

class _AnimalHelpState extends State<AnimalHelp> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //final projdata = Provider.of<ProjData>(context);

    return loading
        ? Loading2()
        : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.blue[900],
          elevation: 0.0,
          title: Text(
            'Help',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.arrow_back),
              textColor: Colors.white,
              label: Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
      drawer: SideBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Card(
            margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.note,
                  color: Colors.blue[900],),
                  title: Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' Name of your animal here. Eg; Nandini(cow)  ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),

                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(leading: Icon(Icons.pets,
                  color: Colors.blue[900],),
                  title: Text(
                    'Breed',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' Breed of your animal here. Eg: Bargur ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),

                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.nature_people,
                    color: Colors.blue[900],),
                  title: Text(
                    'Species',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' Species of your animal here Eg: Cow ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),

                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today,
                    color: Colors.blue[900],),
                  title: Text(
                    'Year of Birth',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' Year of Birth of your animal here  ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),

                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(leading: Icon(Icons.history,
                  color: Colors.blue[900],),
                  title: Text(
                    'Medical History',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' Tell us if your animal has some disease/ problem in past  ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),

                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.add,
                    color: Colors.blue[900],),
                  title: Text(
                    'Add pet',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    ' Click here to add your pet  ',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),

                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
