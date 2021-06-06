import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/general/loading2.dart';

import 'drawer.dart';

class LocationHelp extends StatefulWidget {
  @override
  _LocationHelpState createState() => _LocationHelpState();
}

class _LocationHelpState extends State<LocationHelp> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //final projdata = Provider.of<ProjData>(context);

    return loading
        ? Loading2()
        : Scaffold(
            backgroundColor: Colors.transparent,
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
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          '\nஉங்கள் தற்போதைய இருப்பிடத்தைச் சேர்க்க படிகள்',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '\n\nபொத்தானைக் கிளிக் செய்க \"ஆயத்தொகுதிகளில் உங்கள் சரியான இருப்பிடத்தை அறிய எங்களுக்கு உதவ தற்போதைய இருப்பிடத்தை எடுக்க கிளிக் செய்க. தயவுசெய்து தொலைபேசியை இருப்பிடத்தை அனுமதிக்கவும்.உங்கள் நகரம் / நகரம் / கிராமத்தை 2 வது பெட்டியில் தட்டச்சு செய்ய வேண்டும். தானியங்கி பரிந்துரைகளும் தோன்றும். மூன்றாவது பெட்டியில் உங்கள் இருப்பிடத்திற்கு பெயரிடுங்கள்.அது வீடு, பண்ணை போன்றவையாக இருக்கலாம். தொடர புதிய இருப்பிட பொத்தானைச் சேர்.',
                          style: TextStyle(fontSize: 18.0, color: Colors.black),
                        ),
                        onTap: () {
                          //Navigator.push(context,
                          //MaterialPageRoute(builder: (context) => CasePage()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
