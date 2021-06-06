import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vetappvet/caseclass.dart';

class CaseService {
  final String caseid;

  CaseService({this.caseid});

  final CollectionReference cases = Firestore.instance.collection('Cases');

  /*Future initialiseCaseData(
    String uid,
    String url,
    String puid,
    String position,

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
  ) async {
    String caseid2 = cases.document().documentID;
    return await cases.document(caseid2).setData({
      'caseid': caseid2,
      'uid': uid, //extract using provider
      'url': url,
      'severityDoc': "-1", //ASK SIR....no need to display
      'comment': 'TBA',
      'species': species, //same as below
      'puid': puid, //display animal list...returns animal id on clicked
      'position': position,
      'breed': breed, //same as above
      'severityUser': severityUser,
      'description': description,
      'location': location,
      'status': "-1", //registration, or to be verified(home visit)
      'rdate': rdate,
      'adate': 'TBA',
      'doctor': 'TBA',
      'homevisit': homevisit,
      'year': year,
      'instructions': 'TBA',
      'emergency': emergency,
      'OTP': null,
      'stat': '0',
      'days': 0,
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

  Future updateCaseDataUser(String stat, String severityUser,
      String description, bool homevisit) async {
    caseUpdate(stat);
    return await cases.document(caseid).updateData({
      'severityUser': severityUser,
      'description': description,
      'homevisit': homevisit,
    });
  }

  Future updateDesc(String description) async {
    return await cases.document(caseid).updateData({
      'description': description,
    });
  }

  Future caseOver() async {
    return await cases.document(caseid).updateData({
      'status': 'Closed w/o Doctor, in Observation',
      'stat': '3',
    });
  }

  Future caseUpdate(String stat) async {
    if (stat != '2') {
      return await cases.document(caseid).updateData({
        'status': 'Re-evaluation',
        'stat': '1',
      });
    } else {
      return await cases.document(caseid).updateData(
          {'status': 'Doctor Allocated, Re-evaluation', 'stat': '7'});
    }
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

   */
  Future OTPver(OTP,rOTP) async {
    if(OTP==rOTP)
    return await cases.document(caseid).updateData({
      'stat': '6',
      'status':'Completed'
    });
  }

  CaseData _caseDataFromSnapshot(DocumentSnapshot snapshot) {
    return CaseData(
        caseid: snapshot.data['caseid'],
        puid: snapshot.data['puid'],
        position: snapshot.data['position'],
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
        instructions: snapshot.data['instructions'],
        emergency: snapshot.data['emergency'],
        OTP: snapshot.data["OTP"],
        stat: snapshot.data['stat'],
        code: snapshot.data['code']);
  }

  List<CaseData> _caseListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return CaseData(
          caseid: doc.data['caseid'] ?? "",
          puid: doc.data['puid'] ?? "",
          uid: doc.data['uid'] ?? "",
          species: doc.data['species'] ?? "",
          breed: doc.data['breed'] ?? "",
          position: doc.data['position'] ?? "",
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
          stat: doc.data['stat'] ?? "",
          code: doc.data['code'] ?? "");
    }).toList();
  }

  Stream<CaseData> get caseData {
    return cases.document(caseid).snapshots().map(_caseDataFromSnapshot);
  }

  Stream<List<CaseData>> get Cases {
    return cases.snapshots().map(_caseListFromSnapshots);
  }

  Stream<List<CaseData>> get Cases3 {
    return cases.snapshots().map(_caseListFromSnapshots);
  }

  Stream<List<CaseData>> get Cases2 {
    return cases.orderBy('stat').snapshots().map(_caseListFromSnapshots);
  }
}
class DocCaseService {
  final String caseid;
  final String name;
  final String Docid;

  DocCaseService({this.caseid,this.name,this.Docid});

  final CollectionReference cases = Firestore.instance.collection('Cases');

  /*Future initialiseCaseData(
    String uid,
    String url,
    String puid,
    String position,

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
  ) async {
    String caseid2 = cases.document().documentID;
    return await cases.document(caseid2).setData({
      'caseid': caseid2,
      'uid': uid, //extract using provider
      'url': url,
      'severityDoc': "-1", //ASK SIR....no need to display
      'comment': 'TBA',
      'species': species, //same as below
      'puid': puid, //display animal list...returns animal id on clicked
      'position': position,
      'breed': breed, //same as above
      'severityUser': severityUser,
      'description': description,
      'location': location,
      'status': "-1", //registration, or to be verified(home visit)
      'rdate': rdate,
      'adate': 'TBA',
      'doctor': 'TBA',
      'homevisit': homevisit,
      'year': year,
      'instructions': 'TBA',
      'emergency': emergency,
      'OTP': null,
      'stat': '0',
      'days': 0,
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

  Future updateCaseDataUser(String stat, String severityUser,
      String description, bool homevisit) async {
    caseUpdate(stat);
    return await cases.document(caseid).updateData({
      'severityUser': severityUser,
      'description': description,
      'homevisit': homevisit,
    });
  }

  Future updateDesc(String description) async {
    return await cases.document(caseid).updateData({
      'description': description,
    });
  }

  Future caseOver() async {
    return await cases.document(caseid).updateData({
      'status': 'Closed w/o Doctor, in Observation',
      'stat': '3',
    });
  }

  Future caseUpdate(String stat) async {
    if (stat != '2') {
      return await cases.document(caseid).updateData({
        'status': 'Re-evaluation',
        'stat': '1',
      });
    } else {
      return await cases.document(caseid).updateData(
          {'status': 'Doctor Allocated, Re-evaluation', 'stat': '7'});
    }
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

   */
  Future OTPver(OTP,rOTP /*, notif*/) async {
    if(OTP==rOTP)
      return await cases.document(caseid).updateData({
        'stat': '6',
        'status':'Completed'
       //'notif': 'your case has finished\n' + notif
      });
  }

  CaseData _caseDataFromSnapshot(DocumentSnapshot snapshot) {
    return CaseData(
        caseid: snapshot.data['caseid'],
        puid: snapshot.data['puid'],
        position: snapshot.data['position'],
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
        instructions: snapshot.data['instructions'],
        emergency: snapshot.data['emergency'],
        OTP: snapshot.data["OTP"],
        stat: snapshot.data['stat'],
        code: snapshot.data['code']);
  }


  List<CaseData> _caseListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      if (doc.data['doctor']==name + ',' +Docid ) {
        return CaseData(
            caseid: doc.data['caseid'] ?? "",
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
            stat: doc.data['stat'] ?? " ",
            days: doc.data['days'] ?? 0,
            code: doc.data['code'] ?? " ",);
      }
    }).toList();
  }

  Stream<CaseData> get caseData {
    return cases.document(caseid).snapshots().map(_caseDataFromSnapshot);
  }

  Stream<List<CaseData>> get Cases {
    return cases.snapshots().map(_caseListFromSnapshots);
  }

  Stream<List<CaseData>> get Cases3 {
    return cases.snapshots().map(_caseListFromSnapshots);
  }

  Stream<List<CaseData>> get Cases2 {
    return cases.orderBy('stat').snapshots().map(_caseListFromSnapshots);
  }
}
