import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/english/doctorInfo.dart';
import 'package:vet_app/english/drawer.dart';
import 'package:vet_app/english/imagePicker.dart';
import 'package:vet_app/general/loading.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/general/user.dart';
import 'package:vet_app/general/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class animalInfo extends StatefulWidget {
  @override
  _animalInfoState createState() => _animalInfoState();
}

//test

class _animalInfoState extends State<animalInfo> {
  @override
  Widget build(BuildContext context) {
    final user3 = Provider.of<User>(context);

    return StreamBuilder<PetData>(
        stream: DatabaseService(uid: user3.uid).petData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            PetData user = snapshot.data;
            return MaterialApp(
              home: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/a.jpg'), fit: BoxFit.cover)),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.blue[900],
                    elevation: 0.0,
                    title: Text(
                      'Case Details',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  drawer: SideBar(),
                  body: Builder(builder: (context) {
                    return Center(
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 80, horizontal: 0),
                          child: Form(
                              child: ListView(
                            children: <Widget>[
                              Card(
                                  color: Colors.brown[50],
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 25.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      /*CircleAvatar(
                                        radius: 60.0,
                                        backgroundColor: Colors.grey,
                                      ),

                                      SizedBox(
                                        height: 30.0,
                                      ),*/
                                      ListTile(
                                        leading: Text(
                                          'Animal:',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        title: Text(
                                          user.species,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        //onTap: (){},
                                      ),
                                      ListTile(
                                        leading: Text(
                                          'Breed:',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        title: Text(
                                          user.breed,
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            //fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        //onTap: (){},
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Card(
                                          color: Colors.blue[900],
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 65.0),
                                          child: ListTile(
                                            title: Center(
                                              child: Text(
                                                'MORE INFO',
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          doctorInfo()));
                                            },
                                          )),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                    ],
                                  )),
                            ],
                          ))),
                    );
                  }),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
