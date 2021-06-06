



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappadmin/tabManage.dart';

import 'adminsclass.dart';
import 'database.dart';
import 'drawer.dart';
import 'loading.dart';

class IntroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<Admin>(context);

    return StreamBuilder<AdminData>(
        stream: DatabaseService(aid: user2.aid).adminData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            AdminData user = snapshot.data;
            print(user2.aid);
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
                  backgroundColor: Colors.black,
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
                          color: Colors.black,
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
                          color: Colors.black,
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
