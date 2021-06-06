import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappadmin/admincasebase.dart';
import 'package:vetappadmin/caseClass.dart';
import 'package:vetappadmin/help.dart';

import 'casesNoAppBar.dart';
import 'drawer.dart';

class tabManage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final casedata = Provider.of<List<CaseData>>(context) ?? [];
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(child: Text('Vet App Home')),
            actions: <Widget>[

            /*  FlatButton.icon(
                icon: Icon(Icons.live_help),
                textColor: Colors.white,
                label: Text('HELP',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Help()));
                },
              ),*/


              FlatButton.icon(
                icon: Icon(Icons.hourglass_full),
                textColor: Colors.white,
                label: Text(
                  'Day Over',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  ListView.builder(
                      itemCount: casedata.length,
                      itemBuilder: (context, index) {
                        AdminCaseService(caseid: casedata[index].caseid).incDay(
                            casedata[index].days, casedata[index].status, casedata[index].notif);
                      });
                },
              ),
            ],
            bottom: TabBar(
              unselectedLabelColor: Colors.white60,
              labelColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.looks_one), text: "Phase 1"),
                Tab(icon: Icon(Icons.looks_two), text: "Phase 2"),
                Tab(icon: Icon(Icons.looks_3), text: "Phase 3"),
                Tab(icon: Icon(Icons.looks_4), text: "Phase 4"),
                Tab(icon: Icon(Icons.looks_5), text: "Phase 5")
              ],
            ),
          ),
          drawer: SideBar(),
          body: TabBarView(
            children: [
              CasesLite(tab: 1),
              CasesLite(tab: 2),
              CasesLite(tab: 3),
              CasesLite(tab: 4),
              CasesLite(tab: 5),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Help()));
            },
            child: Icon(Icons.live_help),
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
