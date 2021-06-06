import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vet_app/general/locationClass.dart';
import 'package:vet_app/general/petclass.dart';

class LocBaseService {
  final String locid;
  LocBaseService({this.locid});
  final CollectionReference locs = Firestore.instance.collection('Locations');

  Future initializeLocData(
      String uid, String name, String position, String village) async {
    String locid2 = locs.document().documentID;
    return await locs.document(locid2).setData({
      'locid': locid2,
      'uid': uid,
      'name': name,
      'position': position,
      'village': village
    });
  }

  Future updateLocData(String name) async {
    return await locs.document(locid).updateData({
      'name': name,
    });
  }

  LocationData _locationDataFromSnapshot(DocumentSnapshot snapshot) {
    return LocationData(
        locid: locid,
        uid: snapshot.data['uid'],
        name: snapshot.data['name'],
        village: snapshot.data['village'],
        position: snapshot.data['position']);
  }

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


  Stream<LocationData> get loctData {
    return locs.document(locid).snapshots().map(_locationDataFromSnapshot);
  }

  Stream<List<LocationData>> get Locations {
    return locs.snapshots().map(_locationListFromSnapshots);
  }

  Stream<List<LocationData>> get Locations2 {
    return locs.snapshots().map(_locationListFromSnapshots);
  }
}
