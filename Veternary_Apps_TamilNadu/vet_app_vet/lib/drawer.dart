import 'package:flutter/material.dart';
import 'package:vetappvet/auth.dart';
import 'package:vetappvet/drawerprofile.dart';
import 'package:vetappvet/notifications.dart';
import 'package:vetappvet/settings.dart';
import 'package:vetappvet/tabManage.dart';

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
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
              //child: IntroCardB(),
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
              /*onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IntroCard()));
                //navigation thing
              },*/
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
                    MaterialPageRoute(builder: (context) => tabManage()));
              },
            ),
          ),
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
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
          ),
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
              height: 30.0,
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
                  height: 38.0,
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
