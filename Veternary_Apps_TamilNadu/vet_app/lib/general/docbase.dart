import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_app/general/user.dart';

class DocbaseService {
  final String uid;

  DocbaseService({this.uid});

  final CollectionReference users = Firestore.instance.collection('Doctors');

  Future updateUserData(
      String name, String mobile, String aadhaar, String email) async {
    String uid2 = users.document().documentID;
    return await users.document(uid2).setData({
      'uid': uid2,
      'name': name,
      'mobile': mobile,
      'email': email,
      'aadhaar': aadhaar,
    });
  }

  Future updateAnimalData(String animal, String severity, String pincode,
      String description) async {
    return await users.document(uid).setData({
      'animal': animal,
      'severity': severity,
      'pincode': pincode,
      'description': description,
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      mobile: snapshot.data['mobile'],
      email: snapshot.data['email'],
      aadhaar: snapshot.data['aadhaar'],
    );
  }

  Stream<UserData> get userData {
    return users.document(uid).snapshots().map(_userDataFromSnapshot);
  }
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
  }

  Stream<UserData> get userData {
    return users.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  Stream<PetData> get petData {
    return users.document(uid).snapshots().map(_animalDataFromSnapshot);
  }
}
*/
