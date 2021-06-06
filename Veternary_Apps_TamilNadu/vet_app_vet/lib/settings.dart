import 'package:flutter/material.dart';
import 'package:vetappvet/drawer.dart';
import 'package:vetappvet/languageselectorpage.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          //AppTranslations.of(context).text("tab_settings"),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown[800],
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            // tooltip: 'Add new entry',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      drawer: SideBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        /*decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.png'), fit: BoxFit.cover)),*/
        child: Center(
          child: RaisedButton(
            color: Colors.brown[800],
            child: Text(
              'Change Language',
              //AppTranslations.of(context).text("tab_lang"),
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LanguageSelectorPage()));
            },
          ),
        ),
      ),
    );
  }
}
