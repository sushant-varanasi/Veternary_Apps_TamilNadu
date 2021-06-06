import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/tamil/cases2.dart';
import 'package:vet_app/tamil/drawer.dart';

class doctorInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/a.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideBar(),
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          elevation: 0.0,
          title: Text(
            'கூடுதல் தகவல்கள்',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
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
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
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
                              'மருத்துவரின் பெயர்:',
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
                              'தொலைபேசி எண்:',
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
                              'வந்த தேதி:',
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
                              'நிலை:',
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
                              'முதலுதவி:',
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 65.0),
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    'வீடு',
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
                                          builder: (context) => Cases()));
                                },
                              )),
                        ],
                      )),
                ],
              ))),
        ),
      ),
    );
  }
}
