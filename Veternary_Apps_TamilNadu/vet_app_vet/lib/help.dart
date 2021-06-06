import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'drawer.dart';
import 'loading2.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
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
                backgroundColor: Colors.brown[800],
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
            body: Padding(
              padding: EdgeInsets.only(top: 8),
              child: Card(
                elevation: 5,
                shadowColor: Colors.blueGrey[100],
                margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 15),
                    ListTile(
                      leading: Icon(Icons.library_books, color: Colors.brown[800],),
                      title: Text(
                        'Cases',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        " In this tab you will be able view all cases assigned to you. Case tile can be clicked to view entire details. Moreover there are options to look for similar breed cases, past cases, status. ",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),

                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'Emergency',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        ' This tab contains all the emergency cases. Even this has all options like regular cases tile (see above). ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(Icons.local_hospital,
                        color: Colors.brown[800],),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'Maps',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        ' The locations of the cases can be looked upon. ',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(Icons.location_on,
                        color: Colors.brown[800],),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                 /*   ListTile(
                      title: Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        ' You can choose your location from here by clicling on the dropdown icon. After clicking on it you will get a list of villages. Choose the place where you live',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(Icons.home,
                        color: Colors.blue[900],),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'Home Visit',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        ' You can choose if your animal need home visit by a doctor or not',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(Icons.pets,
                        color: Colors.blue[900],),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'Emergency',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        ' If this is an emergency choose the emergency button',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(Icons.home,
                        color: Colors.blue[900],),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        'Add and Notify Doctors',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        ' Click on this button to add your case.',
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      leading: Icon(Icons.home,
                        color: Colors.blue[900],),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text(
                        'Animals',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        " In this tab you can register your animal by clicking on the add button. After clicking you'll have an option that will ask you for the details of your animal. ",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),

                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(Icons.note,
                        color: Colors.blue[900],),
                      title: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        ' Name of your animal here. Eg: Nandini ',
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
                        ' Breed of your animal here. Eg: Bargur  ',
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
                        ' Species of your animal here. Eg: Cow ',
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
                        ' Year of Birth of your animal here Eg: 2015 ',
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
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        " In this tab you will be able to add your location by clicking on the add button.  ",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),

                    ),*/
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
