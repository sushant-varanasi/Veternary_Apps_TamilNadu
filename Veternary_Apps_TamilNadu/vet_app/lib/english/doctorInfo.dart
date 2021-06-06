import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/english/cases.dart';
import 'package:vet_app/general/constants.dart';
import 'package:vet_app/english/drawer.dart';
import 'package:vet_app/general/loading.dart';

class doctorInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/a.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideBar(),
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          elevation: 0.0,
          title: Text('More Details',
          style: TextStyle(
            color: Colors.white,
          ),),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 0),
              child: Form(
                  child: ListView(
                    children: <Widget>[
                      /*Center(
                        child: Text('MORE',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),*/
                      Card(
                          color: Colors.brown[50],
                          margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 30.0,
                              ),
                              CircleAvatar(
                                radius: 60.0,
                                backgroundImage: AssetImage('images/pet.png'),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              ListTile(
                                leading: Text(
                                  'Doctor\'s Name:',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                title: Text(
                                  '...',
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
                                  'Phone No:',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                title: Text(
                                  '...',
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
                                  'Date of Arrival:',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                title: Text(
                                  '...',
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
                                  'Status:',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                title: Text(
                                  '...',
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
                                  'First Aid:',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                title: Text(
                                  '...',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                //onTap: (){},
                              ),
                              Card(
                                  color: Colors.blue[900],
                                  margin:
                                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 65.0),
                                  child: ListTile(
                                    title: Center(
                                      child: Text(
                                        'HOME',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) => Cases()));
                                    },
                                  )),
                            ],
                          )),

                    ],
                  ))
          ),

        ),
      ),
    );
  }
}