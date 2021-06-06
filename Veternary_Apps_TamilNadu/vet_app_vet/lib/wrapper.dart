import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappvet/authenticate.dart';
import 'package:vetappvet/docclass.dart';
import 'package:vetappvet/tabManage.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Doctor>(
        context); //gets user data from provider which is above it so used of
    if (user == null) {
      return Authenticate();
    } else {
      return tabManage();
    }
  }
}
