import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappadmin/docbase.dart';
import 'package:vetappadmin/docclass.dart';
import 'package:vetappadmin/doctorslist.dart';

class Doctors extends StatefulWidget {
  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Doctordata>>.value(
        value: DocbaseService().Doctors,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Doctors',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
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
          //drawer: SideBar(),
          body: Container(
            constraints: BoxConstraints.expand(),

            child: Doctorlist(),
          ),
        ));
  }
}
