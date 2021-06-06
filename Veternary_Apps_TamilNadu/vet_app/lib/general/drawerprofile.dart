import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/user.dart';
import 'package:vet_app/general/database.dart';

class IntroCardB extends StatefulWidget {
  @override
  _IntroCardBState createState() => _IntroCardBState();
}

class _IntroCardBState extends State<IntroCardB> {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user2.uid).userData,
        builder: (context, snapshot) {
          UserData user = snapshot.data;
          print(user2.uid);
          return Container(
            child: Column(
              children: <Widget>[
                (CircleAvatar(
                    backgroundImage: AssetImage('images/a.jpg'), radius: 40)),
                SizedBox(
                  height: 6,
                ),
                Text(
                  user.name ?? null,
                  style: TextStyle(
                    //fontFamily: 'Pacifico',
                    fontSize: 25.0,
                    color: Colors.brown[500],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
