import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/LocationBase.dart';
import 'package:vet_app/english/addDummyPet.dart';
import 'package:vet_app/english/animalselectionlist.dart';
import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/english/newcase.dart';

class CaseChoice extends StatefulWidget {
  @override
  _CaseChoiceState createState() => _CaseChoiceState();
}

class _CaseChoiceState extends State<CaseChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'New Case',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[

        ],
      ),
      body: Container(
        /*constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.png'),
                fit: BoxFit.cover)),*/
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Use Registered Animal?',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[900])),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    color: Colors.blue[900],
                    splashColor: Colors.blue[800],
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => setState(() {
//np = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PetSelection())); //Animalselectionlist
                    }),
                  ),
                  SizedBox(height: 42, width: 20,),
                  FlatButton(
                    color: Colors.blue[900],
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => setState(() {
//np = true;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddDPet())); //Adddummypet
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
