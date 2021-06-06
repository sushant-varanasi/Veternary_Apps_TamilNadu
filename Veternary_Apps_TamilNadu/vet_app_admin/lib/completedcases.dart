import 'package:flutter/material.dart';

import 'casesNoAppBar.dart';
import 'drawer.dart';

class CompCases extends StatefulWidget {
  @override
  _CompCasesState createState() => _CompCasesState();
}

class _CompCasesState extends State<CompCases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Completed Cases',
          //AppTranslations.of(context).text("tab_settings"),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
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
      body: CasesLite(tab: 10),


      /*Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.png'),
                fit: BoxFit.cover)),
        */

        /*child: Center(
          child: RaisedButton(
            color: Colors.blue[900],
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
        ),*/

    );
  }
}
