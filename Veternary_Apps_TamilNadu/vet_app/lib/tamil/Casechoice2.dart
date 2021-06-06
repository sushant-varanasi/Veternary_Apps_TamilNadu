import 'package:flutter/material.dart';
import 'package:vet_app/tamil/addDummyPet2.dart';
import 'package:vet_app/tamil/animalselectionlist2.dart';

class CaseChoice2 extends StatefulWidget {
  @override
  _CaseChoiceState createState() => _CaseChoiceState();
}

class _CaseChoiceState extends State<CaseChoice2> {
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
          'புதிய வழக்கு',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        actions: <Widget>[],
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
              Text('பதிவுசெய்யப்பட்ட விலங்குகளைப் பயன்படுத்துங்கள்',
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
                      'ஆம்',
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
                  SizedBox(
                    height: 42,
                    width: 20,
                  ),
                  FlatButton(
                    color: Colors.blue[900],
                    child: Text(
                      'இல்லை',
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
