import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_app/english/drawer.dart';
import 'package:vet_app/general/loading.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/english/tabManage.dart';
import 'package:vet_app/general/user.dart';
import 'package:vet_app/general/database.dart';
import 'package:vet_app/english/cases.dart';

class IntroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user2.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData user = snapshot.data;
            print(user2.uid);
            return Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/as.jpg'), fit: BoxFit.cover)),
              child: Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.blue[900],
                  elevation: 0.0,
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        'https://firebasestorage.googleapis.com/v0/b/vetapptn.appspot.com/o/images%2F2020-08-28%2023%3A59%3A42.016510.png?alt=media&token=e7cf7020-4124-4a25-a5bc-9dac5e480ecf',
                        width: 200,
                        height: 200,
                      ),
                      Text(
                        user.name,
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 40.0,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                        width: 150.0,
                        child: Divider(
                          color: Colors.white,
                          thickness: 3.0,
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            title: Text(
                              user.mobile,
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              ),
                            )),
                      ),
                      Card(
                          color: Colors.blue[900],
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 65.0),
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
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => tabManage()));
                            },
                          )),
                    ],
                  ),
                ),
              ),
            );
            // );
          } else {
            return Loading();
          }
        });
  }
}
