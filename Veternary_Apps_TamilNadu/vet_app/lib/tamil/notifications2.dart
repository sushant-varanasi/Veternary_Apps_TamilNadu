import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vet_app/general/caseBase.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/general/notifList.dart';
import 'package:vet_app/tamil/drawer.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CaseData>>.value(
      value: CaseService().Cases,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'அறிவிப்புகள்',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue[900],
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        drawer: SideBar(),
        body:
            Container(constraints: BoxConstraints.expand(), child: NotifList()),
      ),
    );
  }
}
