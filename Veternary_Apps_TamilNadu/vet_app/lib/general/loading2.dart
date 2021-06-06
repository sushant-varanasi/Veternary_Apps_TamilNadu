import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child:Center(
          child: SpinKitRipple(
            color: Colors.blue[900],
            size:100,
          ),
        )
    );
  }
}