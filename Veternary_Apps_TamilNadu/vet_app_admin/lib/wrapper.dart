import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vetappadmin/admincasebase.dart';
import 'package:vetappadmin/caseClass.dart';
import 'package:vetappadmin/tabManage.dart';
import 'adminsclass.dart';
import 'authenticate.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Admin>(
        context); //gets user data from provider which is above it so used of
    if (user == null) {
      return Authenticate();
    } else {
      return StreamProvider<List<CaseData>>.value(
          value: AdminCaseService().Cases6, child: tabManage());
    }
  }
}
