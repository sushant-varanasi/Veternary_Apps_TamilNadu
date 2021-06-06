import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vetappadmin/adminsclass.dart';

class DatabaseService {
final String aid;
DatabaseService({this.aid});
final CollectionReference admins = Firestore.instance.collection('Admins');

Future updateAdminData(
    String name, String mobile, String aadhaar, String email) async {

  return await admins.document(aid).setData({
    'aid': aid,
    'name': name,
    'mobile': mobile,
    'email': email,
    'aadhaar': aadhaar,
  });
}
/*
Future updateAnimalData(String animal, String severity, String pincode,
    String description) async {
  return await users.document(uid).setData({
    'animal': animal,
    'severity': severity,
    'pincode': pincode,
    'description': description,
  });
}*/

AdminData _adminDataFromSnapshot(DocumentSnapshot snapshot) {
  return AdminData(
    aid: aid,
    name: snapshot.data['name'],
    mobile: snapshot.data['mobile'],
    email: snapshot.data['email'],
    aadhaar: snapshot.data['aadhaar'],
  );
}
/*
PetData _animalDataFromSnapshot(DocumentSnapshot snapshot) {
  return PetData(
    uid: uid,
    puid: snapshot.data['puid'],
    name: snapshot.data['name'],
    species: snapshot.data['species'],
    breed: snapshot.data['breed'],
    history: snapshot.data['history'],
  );
}*/
/*
UserData userFromPh(String phno){
  users.document(uid);
}*/


Stream<AdminData> get adminData {
  return admins.document(aid).snapshots().map(_adminDataFromSnapshot);
}

/*
Stream<PetData> get petData {
  return users.document(uid).snapshots().map(_animalDataFromSnapshot);
}
 */

}
