import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappvet/docbase.dart';
import 'package:vetappvet/docclass.dart';

class IntroCardB extends StatefulWidget {
  @override
  _IntroCardBState createState() => _IntroCardBState();
}

class _IntroCardBState extends State<IntroCardB> {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<Doctor>(context);
    return StreamBuilder<Doctordata>(
        stream: DocbaseService(docid: user2.docid).userData,
        builder: (context, snapshot) {
          Doctordata user = snapshot.data;
          print(user2.docid);
          return Container(
            child: Column(
              children: <Widget>[
                (CircleAvatar(
                    backgroundImage: AssetImage('images/a.jpg'), radius: 40)),
                Text(
                  user.name ?? null,
                  style: TextStyle(
                    //fontFamily: 'Pacifico',
                    fontSize: 25.0,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
