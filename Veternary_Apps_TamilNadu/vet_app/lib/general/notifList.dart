import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vet_app/general/caseClass.dart';
import 'package:vet_app/general/user.dart';
import '../english/notifTile.dart';

class NotifList extends StatefulWidget {
  @override
  _NotifListState createState() => _NotifListState();
}

class _NotifListState extends State<NotifList> {
  @override
  Widget build(BuildContext context) {
    final user2 = Provider.of<User>(context);
    final cases = Provider.of<List<CaseData>>(context) ?? [];

    return ListView.builder(
        itemCount: cases.length,
        itemBuilder: (context, index) {
          print(index);
          print(cases.length);

          return cases[index].uid == user2.uid
              ? NotifTile(casestile: cases[index])
              : Container();
        });
  }
}
