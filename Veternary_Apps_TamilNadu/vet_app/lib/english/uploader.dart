import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vet_app/english/addpetdata.dart';
import 'package:vet_app/english/newDummyCase.dart';
import 'package:vet_app/english/newcase.dart';
import 'package:vet_app/general/petclass.dart';

class Uploader extends StatefulWidget {
  final PetData petcase2;
  final int i;
  final File file;
  final int noOfAnimals;
  Uploader({Key key, this.file, this.petcase2, this.i, this.noOfAnimals})
      : super(key: key);
  @override
  _UploaderState createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  bool uploading = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton.icon(
          label: Text('Upload'),
          icon: Icon(Icons.cloud_upload),
          onPressed: _startUpload,
        ),
        if (uploading == true)
          FlatButton.icon(
            label: Text('Done'),
            icon: Icon(Icons.check),
            onPressed: () {
              if (widget.i == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NewCase(imageurl: image, petcase: widget.petcase2),
                    ));
              }
              if (widget.i == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPet(url: image),
                    ));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewDumCase(
                          imageurl: image,
                          petcase: widget.petcase2,
                          noOfAnimals: widget.noOfAnimals),
                    ));
              }
            },
          )
      ],
    );
  }

  String image;

  /// Starts an upload task
  void _startUpload() async {
    String fileName =
        'images/' + DateTime.now().millisecondsSinceEpoch.toString() + '.png';
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask _uploadTask = reference.putFile(widget.file);
    StorageTaskSnapshot storageTaskSnapshot = await _uploadTask.onComplete;
    if (_uploadTask.isComplete) {
      uploading = true;
      Fluttertoast.showToast(msg: 'Your image is Uploaded.');
    }
    setState(
      () {
        storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
          image = downloadUrl;
        });
      },
    );

    /// Unique file name for the file
  }
}
