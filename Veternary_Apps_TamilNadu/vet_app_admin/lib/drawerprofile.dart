

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'adminsclass.dart';
import 'database.dart';

class IntroCardB extends StatefulWidget {
  @override
  _IntroCardBState createState() => _IntroCardBState();
}

class _IntroCardBState extends State<IntroCardB> {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<Admin>(context);
    return StreamBuilder<AdminData>(
        stream: DatabaseService(aid: user2.aid).adminData,
        builder: (context, snapshot) {
          AdminData user = snapshot.data;
          print(user2.aid);
          return Container(
            child: Column(
              children: <Widget>[
                (CircleAvatar(
                    backgroundImage: AssetImage('images/a.jpg'), radius: 40)),
                Text(
                  user.name ?? null,
                  style: TextStyle(
                    //fontFamily: 'Pacifico',
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
