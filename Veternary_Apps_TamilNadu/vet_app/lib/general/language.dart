import 'package:flutter/material.dart';
import 'package:vet_app/english/wrapper1.dart';
import 'package:vet_app/tamil/wrapper2.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  //languagesList also moved to the Application class just like the languageCodesList
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "Select language",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: <Widget>[

        Center(
          child: Image(
            image: AssetImage('images/pet.png'),
            height: 280.0,
            width: 280.0,
          ),
        ),
        SizedBox(height: 20),
        Card(
            color: Colors.blue[900],
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              title: Center(
                child: Text(
                  'ENGLISH',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => wrapper1()));
              },
            )),
        SizedBox(
          height: 8.0,
        ),
        Card(
            color: Colors.blue[900],
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              title: Center(
                child: Text(
                  'TAMIL',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => wrapper2()));
              },
            )),
      ]),
    );
  }
}
