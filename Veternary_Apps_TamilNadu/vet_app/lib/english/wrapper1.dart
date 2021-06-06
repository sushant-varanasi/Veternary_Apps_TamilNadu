import 'package:flutter/material.dart';
import 'package:vet_app/english/authchoose.dart';
import 'package:vet_app/english/tabManage.dart';
import 'package:vet_app/general/user.dart';
import 'package:provider/provider.dart';

class wrapper1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(
        context); //gets user data from provider which is above it so used of
    if (user == null) {
      return authChoose();
    } else {
      return tabManage();
    }
  }
}
