import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vetappadmin/docclass.dart';

class DocbaseService {
  final String docid;

  DocbaseService({this.docid});

  final CollectionReference doctors = Firestore.instance.collection('Doctors');

  Future updateUserData(
      String name, String mobile, String aadhaar, String email) async {
    String uid2 = doctors.document().documentID;
    return await doctors.document(docid).setData({
      'docid': uid2,
      'name': name,
      'mobile': mobile,
      'email': email,
      'aadhaar': aadhaar,
    });
  }

  Future updateAnimalData(String animal, String severity, String pincode,
      String description) async {
    return await doctors.document(docid).setData({
      'animal': animal,
      'severity': severity,
      'pincode': pincode,
      'description': description,
    });
  }

  Doctordata _doctorDataFromSnapshot(DocumentSnapshot snapshot) {
    return Doctordata(
      docid: docid,
      name: snapshot.data['name'],
      mobile: snapshot.data['mobile'],
      email: snapshot.data['email'],
      aadhar: snapshot.data['aadhaar'],
    );
  }

  List<Doctordata> _doctorsListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Doctordata(
        docid: doc.data['docid'] ?? '',
        name: doc.data['name'] ?? '',
        // speciality: doc.data['speciality'] ?? '',
        mobile: doc.data['mobile'] ?? '',
        //  locality: doc.data['locality'] ?? '',
        aadhar: doc.data['aadhaar'] ?? '',
      );
    }).toList();
  }

  Stream<List<Doctordata>> get Doctors {
    return doctors.snapshots().map(_doctorsListFromSnapshots);
  }

  Stream<List<Doctordata>> get Doctors2 {
    return doctors.snapshots().map(_doctorsListFromSnapshots);
  }

  Stream<Doctordata> get userData {
    return doctors.document(docid).snapshots().map(_doctorDataFromSnapshot);
  }
}
