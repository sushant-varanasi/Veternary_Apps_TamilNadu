import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vetappvet/allcaseslist.dart';
import 'package:vetappvet/casebase.dart';
import 'package:vetappvet/caseclass.dart';

class LocationLite extends StatefulWidget {
  @override
  _LocationLiteState createState() => _LocationLiteState();
}

class _LocationLiteState extends State<LocationLite> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CaseData>>.value(
      value: CaseService().Cases,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            constraints: BoxConstraints.expand(),
            child: AllCasesList()),
      ),
    );
  }
}

/* return Scaffold(
      body: new Center(
        child: new RaisedButton(
          onPressed: _launchURL,
          child: new Text('Show Flutter homepage'),
        ),
      ),
    );*/

/*_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/
