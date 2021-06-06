import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappadmin/docclass.dart';
import 'package:vetappadmin/doctortile.dart';

class Doctorlist extends StatefulWidget {
  @override
  _DoctorlistState createState() => _DoctorlistState();
}

class _DoctorlistState extends State<Doctorlist> {
  @override
  Widget build(BuildContext context) {
    final doctors = Provider.of<List<Doctordata>>(context) ?? [];
    return ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return DoctorTile(doctor: doctors[index]);
        });
  }
}
