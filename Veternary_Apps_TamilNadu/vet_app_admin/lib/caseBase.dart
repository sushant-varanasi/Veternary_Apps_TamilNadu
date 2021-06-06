import 'package:cloud_firestore/cloud_firestore.dart';

import 'caseClass.dart';

class CaseService {
  final String caseid;

  CaseService({this.caseid});

  final CollectionReference cases = Firestore.instance.collection('Cases');

  Future initialiseCaseData(
    String uid,
    String puid,

    ///String severityDoc,
    // String comment,
    String species,
    String breed,
    String severityUser,
    String description,
    String location,
    String year,
    String rdate,
    //String status,
    //String rdate,
    bool homevisit,
    bool emergency,
      String latlong
  ) async {
    String caseid2 = cases.document().documentID;
    return await cases.document(caseid2).setData({
      'caseid': caseid2,
      'uid': uid, //extract using provider
      'severityDoc': "-1", //ASK SIR....no need to display
      'comment': 'TBA',
      'species': species, //same as below
      'puid': puid, //display animal list...returns animal id on clicked
      'breed': breed, //same as above
      'severityUser': severityUser,
      'description': description,
      'location': location,
      'status': "-1", //registration, or to be verified(home visit)
      'rdate': rdate,
      'adate': 'TBA',
      'latlong':latlong,
      'doctor': 'TBA',
      'homevisit': homevisit,
      'year': year,
      'instructions': 'TBA',
      'emergency': emergency,
      'OTP': null,
      'stat': '0',
      'days': 0,
      'notif': "",
    });
  }
/*
  Future updateCaseDataDoc(String severityDoc, String comment,
      String adate, String doctor, String homevisit) async {
    return await cases.document(caseid).setData({
      'severityDoc': severityDoc,
      'comment': comment,
      'adate': adate,
      'doctor': doctor,
      'homevisit': homevisit,
    });
  }

 */

  Future updateCaseDataUser(
      String severityUser, String description, bool homevisit) async {
    caseUpdate();
    return await cases.document(caseid).updateData({
      'severityUser': severityUser,
      'description': description,
      'homevisit': homevisit,
    });
  }

  Future caseOver() async {
    return await cases.document(caseid).updateData({
      'status': 'Closed w/o Doctor, in Observation',
      'stat': '3',
    });
  }

  Future caseUpdate() async {
    return await cases.document(caseid).updateData({
      'status': 'Re-evaluation',
      'stat': '1',
    });
  }

  Future Doc2Case(caseid) async {
    return await (cases.document(caseid).get());
  }

  Future caseOver2() async {
    return await cases
        .document(caseid)
        .updateData({'status': 'Await OTP confirmation', 'stat': '5'});
  }

  Future OTPgen(int OTP) async {
    return await cases.document(caseid).updateData({
      'OTP': OTP,
    });
  }

  Future sendNotif(String notif) async {
    return await cases.document(caseid).updateData({
      'notif': notif,
    });

  }


  CaseData _caseDataFromSnapshot(DocumentSnapshot snapshot) {
    return CaseData(
        caseid: snapshot.data['caseid'],
        imageurl: snapshot.data['imageurl'],
        puid: snapshot.data['puid'],
        uid: snapshot.data['uid'],
        species: snapshot.data['species'],
        breed: snapshot.data['breed'],
        severityDoc: snapshot.data['severityDoc'],
        severityUser: snapshot.data['severityUser'],
        description: snapshot.data['description'],
        location: snapshot.data['location'],
        comment: snapshot.data['comment'],
        status: snapshot.data['status'],
        adate: snapshot.data['adate'],
        rdate: snapshot.data['rdate'],
        doctor: snapshot.data['doctor'],
        homevisit: snapshot.data['homevisit'],
        year: snapshot.data['year'],
        days:snapshot.data['days'],
        instructions: snapshot.data['instructions'],
        emergency: snapshot.data['emergency'],
        OTP: snapshot.data["OTP"],
        stat: snapshot.data['stat'],
    latlong: snapshot.data['latlong'],
        notif: snapshot.data['notif']);
  }

  List<CaseData> _caseListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return CaseData(
          caseid: doc.data['caseid'] ?? "",
          imageurl: doc.data['imageurl'] ?? "",
          puid: doc.data['puid'] ?? "",
          uid: doc.data['uid'] ?? "",
          species: doc.data['species'] ?? "",
          breed: doc.data['breed'] ?? "",
          location: doc.data['location'],
          severityDoc: doc.data['severityDoc'] ?? "",
          severityUser: doc.data['severityUser'] ?? "",
          description: doc.data['description'] ?? "",
          comment: doc.data['comment'] ?? "",
          status: doc.data['status'] ?? "",
          adate: doc.data['adate'] ?? "",
          rdate: doc.data['rdate'] ?? "",
          doctor: doc.data['doctor'] ?? "",
          homevisit: doc.data['homevisit'] ?? false,
          emergency: doc.data['emergency'] ?? false,
          year: doc.data['year'] ?? "",
          instructions: doc.data['instructions'] ?? "",
          OTP: doc.data['OTP'] ?? null,
          days:doc.data['days'] ?? null,
          stat: doc.data['stat'] ?? " ",
          latlong: doc.data['latlong'] ?? " ",
          notif: doc.data['notif'] ?? " ",
      );
    }).toList();
  }

  Stream<CaseData> get caseData {
    return cases.document(caseid).snapshots().map(_caseDataFromSnapshot);
  }

  Stream<List<CaseData>> get Cases {
    return cases.snapshots().map(_caseListFromSnapshots);
  }

  Stream<List<CaseData>> get Cases2 {
    return cases.orderBy('stat').snapshots().map(_caseListFromSnapshots);
  }
}
