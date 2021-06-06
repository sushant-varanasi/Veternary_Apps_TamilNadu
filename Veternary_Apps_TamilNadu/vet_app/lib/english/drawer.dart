import 'package:flutter/material.dart';
import 'package:vet_app/english/animallist.dart';
import 'package:vet_app/general/auth.dart';
import 'package:vet_app/english/cases.dart';
import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/english/locations.dart';
import 'package:vet_app/english/newLocation.dart';
import 'package:vet_app/english/notifications.dart';
import 'package:vet_app/english/profile.dart';

import 'package:vet_app/english/tabManage.dart';
import 'package:vet_app/tamil/tabManage2.dart';
import 'package:vet_app/english/userprofile.dart';

import 'package:vet_app/general/drawerprofile.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/user.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  final AuthService _auth = AuthService();
  Widget build(BuildContext context) {
    //final user = Provider.of<UserData>(context);
    return Drawer(
      child: ListView(

        children: <Widget>[
          Container(
            color: Colors.yellow[100],
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                border: Border(
                  bottom: BorderSide(color: Colors.brown[500], width: 3.0),
                ),
              ),
              child: IntroCardB(),
            ),
          ),
          Container(
            color: Colors.yellow[100],
            child: SizedBox(
              height: 20.0,
            ),
          ),
          Container(
            color: Colors.yellow[100],
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.brown[500],
              ),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 20.0, color: Colors.brown[800]),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IntroCard()));
                //navigation thing
              },
            ),
          ),
          Container(
            color: Colors.yellow[100],
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.brown[500],
              ),
              title: Text(
                'Home',
                //AppTranslations.of(context).text("tab_pet"),
                style: TextStyle(fontSize: 20.0, color: Colors.brown[800]),
              ),
              onTap: () {
                //navigation thing
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => tabManage2()));
              },
            ),
          ),
          /*
          Container(
            color: Colors.yellow[100],
            child: ListTile(
              leading: Icon(
                Icons.library_books,
                color: Colors.brown[500],
              ),
              title: Text(
                'Cases',
                //AppTranslations.of(context).text("tab_settings"),
                style: TextStyle(fontSize: 20.0, color: Colors.brown[800]),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cases()));
              },
            ),
          ),
          Container(
            color: Colors.yellow[100],
            child: ListTile(
              leading: Icon(
                Icons.pets,
                color: Colors.brown[500],
              ),
              title: Text(
                'My pet',
                //AppTranslations.of(context).text("tab_pet"),
                style: TextStyle(fontSize: 20.0, color: Colors.brown[800]),
              ),
              onTap: () {
                //navigation thing
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnimalList()));
              },
            ),
          ),



          Container(
            color: Colors.yellow[100],
            child: ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.brown[500],
              ),
              title: Text(
                'My Locations',
                //AppTranslations.of(context).text("tab_pet"),
                style: TextStyle(fontSize: 20.0, color: Colors.brown[800]),
              ),
              onTap: () {
                //navigation thing
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Locations()));
              },
            ),
          ),

           */
          Container(
            color: Colors.yellow[100],
            child: ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.brown[500],
              ),
              title: Text(
                'Notification',
                // AppTranslations.of(context).text("tab_notifications"),
                style: TextStyle(fontSize: 20.0, color: Colors.brown[800]),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
            ),
          ),
          Container(
            color: Colors.yellow[100],
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.brown[500],
              ),
              title: Text(
                'Settings',
                // AppTranslations.of(context).text("tab_settings"),
                style: TextStyle(fontSize: 20.0, color: Colors.brown[800]),
              ),
             /* onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },*/
            ),
          ),
          /*Container(
            color: Colors.yellow[100],
            child: SizedBox(
              height: 15.0,
            ),
          ),*/
          Container(
            color: Colors.yellow[100],
            child: ListTile(
              leading: Icon(
                Icons.label,
                color: Colors.brown[500],
              ),
              title: Text(
                "About",
                // AppTranslations.of(context).text("tab_about"),
                style: TextStyle(fontSize: 20.0, color: Colors.brown[800]),
              ),
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationVersion: '1.0.1',
                    applicationIcon: Icon(Icons.access_alarm),
                    applicationLegalese: 'applicationLegalese',
                    applicationName: 'VetApp');
              },
            ),
          ),
          Container(
            color: Colors.yellow[100],
            child: SizedBox(
              height: 25.0,
              width: 5.0,
              child: Divider(
                color: Colors.brown[800],
              ),
            ),
          ),
          Container(
            color: Colors.yellow[100],
            child: ListTile(
              leading: Icon(
                Icons.lock,
                color: Colors.brown[500],
              ),
              title: Text(
                'LogOut',
                //AppTranslations.of(context).text("tab_logout"),
                style: TextStyle(fontSize: 20.0, color: Colors.brown[800]),
              ),
              onTap: () async {
                await _auth.signOut();
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            color: Colors.yellow[100],
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 35.0,
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      'VetApp',
                      style: TextStyle(
                        color: Colors.brown[800],
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      'A Virtual Allocation App',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.yellow[100],
                  child: SizedBox(
                    height: 92.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
