import 'package:flutter/material.dart';

import 'package:vet_app/general/petclass.dart';
import 'package:vet_app/tamil/imagePicker.dart';

class AddImage extends StatefulWidget {
  final PetData petcase;
  final int i;
  final int noOfAnimals;
  AddImage({this.i, this.petcase, this.noOfAnimals});
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('படத்தைச் சேர்க்கவும்'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageCapture(
                          petcase2: widget.petcase,
                          i: widget.i,
                          noOfAnimals: widget.noOfAnimals)));
            },
            child: Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FlatButton(
            color: Colors.blue[900],
            child: Text(
              "படத்தைச் சேர்க்கவும்",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ImageCapture(petcase2: widget.petcase, i: widget.i)));
            },
          ),

/*
      child: Column(
        children:
        Widget[
          GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ImageCapture(
                        petcase2: widget.petcase,i:widget.i
                      )));
        },
        child: Center(
          child: CircleAvatar(
            radius: 60.0,
            backgroundColor: Colors.grey[200],
          ),
        ),
      ),
      ],
      ),
    );

 */
          Text(
            '\n\nதீவிரத்தை மதிப்பிடுவதற்கு இது உதவுவதால் படத்தைச் சேர்க்கவும்',
            style: TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
