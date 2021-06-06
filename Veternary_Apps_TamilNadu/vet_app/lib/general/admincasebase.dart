import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_app/general/caseClass.dart';

class AdminCaseService {
  final String caseid;

  AdminCaseService({this.caseid});

  final CollectionReference cases = Firestore.instance.collection('Cases');

  Future updateCaseDataDoc(String severityDoc, String comment, bool homevisit,
      String Instructions, String stat) async {
    if (stat != '7') {
      return await cases.document(caseid).setData({
        'severityDoc': severityDoc,
        'instructions': Instructions,
        'comment': comment,
        'homevisit': homevisit,
        'stat': '0',
        'status': 'Pending Visit'
      });
    } else {
      return await cases.document(caseid).setData({
        'severityDoc': severityDoc,
        'instructions': Instructions,
        'comment': comment,
        'homevisit': homevisit,
      });
    }
  }

  Future caseOver() async {
    return await cases.document(caseid).updateData({
      'status': 'Closed',
      'stat': '6',
    });
  }

  Future caseOverW() async {
    return await cases.document(caseid).updateData({
      'status': 'Closed w/o Doctor',
      'stat': '4',
    });
  }

  Future incDay() async {
    return await cases.document(caseid).updateData({
      //'days': days+1,
      //if status=-1,0,1,2
    });
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

  CaseData _caseDataFromSnapshot(DocumentSnapshot snapshot) {
    return CaseData(
        caseid: snapshot.data['caseid'],
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
        instructions: snapshot.data['instructions'],
        emergency: snapshot.data['emergency'],
        OTP: snapshot.data["OTP"],
        stat: snapshot.data['stat']);
  }

  List<CaseData> _caseListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
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
          stat: doc.data['stat'] ?? " ");
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
