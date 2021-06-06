import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/general/petclass.dart';

class LocBaseService2 {
  final String locid;
  final String uid;

  LocBaseService2({this.locid, this.uid});

  final CollectionReference locs = Firestore.instance.collection('Locations');


  List<LocationData> _locationListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return LocationData(
        uid: doc.data['uid'] ?? '',
        locid: doc.data['locid'] ?? '',
        name: doc.data['name'] ?? '',
        village: doc.data['village'] ?? '',
        position: doc.data['position'] ??
            '', //may cause error find default value for positon
      );
    }).toList();
  }

  List<LocationData> _locationListFromSnapshots2(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      if (doc.data['uid'] == uid) {
        return LocationData(
          uid: doc.data['uid'] ?? '',
          locid: doc.data['locid'] ?? '',
          name: doc.data['name'] ?? '',
          village: doc.data['village'] ?? '',
          position: doc.data['position'] ??
              '', //may cause error find default value for positon
        );
      }
    }).toList();
  }



  Stream<List<LocationData>> get Locations3 {
    return locs.snapshots().map(_locationListFromSnapshots2);
  }
}