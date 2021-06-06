import 'package:cloud_firestore/cloud_firestore.dart';

import 'caseClass.dart';

class AdminCaseService {
  final String caseid;


 String getCurrentDate() {

    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "        ${dateParse.hour}:${dateParse.minute}   ${dateParse.day}-${dateParse.month}-${dateParse.year}";


    var finalDate = formattedDate.toString();
      //Access date by using $finalDate
      //Changes to be made in database
    return finalDate;
  }


  AdminCaseService({this.caseid});

  var tom= new DateTime.now().add(new Duration(days: 1));
  final CollectionReference cases = Firestore.instance.collection('Cases');

  Future updateCaseDataDoc(String severityDoc, String comment, bool homevisit,
      String Instructions, String stat,  String notif) async {
    if (stat != '7') {
      return await cases.document(caseid).updateData({
        'severityDoc': severityDoc,
        'instructions': Instructions,
        'comment': comment,
        'homevisit': homevisit,
        'stat': '0',
        'status': 'Pending Visit',
        'notif': 'Satus changed to 0...'+ getCurrentDate() +'\n' + notif,
      });
    } else {
      return await cases.document(caseid).updateData({
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

  Future allocateDoc(String Docid, String name) async {
    return await cases.document(caseid).updateData({
      'doctor': name + ',' + Docid,
      'status': 'Allocated Doctor ' + name,
      'stat': '2',
      'adate':tom.toString(),
    });
  }


  Future sendNotif(String notif) async {
    return await cases.document(caseid).updateData({
      'notif': notif,
    });

  }

  /*
  Future deallocateDoc() async {
    return await cases.document(caseid).updateData({
      'doctor': '',
      'status': 'Pending Visit',
      'stat': '0',
    });
  }


   */
  Future caseOverW(String notif) async {

    //String notif = ;
    sendNotif("vfddd\n" + notif );

    return await cases.document(caseid).updateData({
      'status': 'Closed w/o Doctor',
      'stat': '4',

    });
  }

  Future incDay(int days, String stat, String notif) async {
    if (stat == '3') {
      return await cases.document(caseid).updateData({
        'status': 'Closed w/o Doctor',
        'stat': '4',
        'days': days + 1,
        'notif': 'status from 3 to 4...'+ getCurrentDate() +'\n' + notif,
      });
    }
    if (stat == '2') {
      return await cases.document(caseid).updateData({
        'doctor': '',
        'status': 'Pending Visit',
        'stat': '0',
        'adate':'TBA',
        'days': days + 1,
        'notif': 'status from 2 to 0...'+ getCurrentDate() +'\n' + notif,
      });
    }
    return await cases.document(caseid).updateData({
      'days': days + 1,
      //if status=-1,0,1,2
    });
  }

  Future Allocate(String Docid) async {
    //calculate score
    //Cases3.
    //increase day
    //allocate doctor
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

        stat: snapshot.data['stat'],
        days: snapshot.data['days'],
    notif: snapshot.data['notif']);
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
          stat: doc.data['stat'] ?? "",
          days: doc.data['days'] ?? 0,
      notif: doc.data['notif'] ?? " ");
    }).toList();
  }

  List<CaseData> _caseListFromSnapshots2(QuerySnapshot snapshot) {
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
          stat: doc.data['stat'] ?? " ",
          days: doc.data['days'] ?? 0,
          notif: doc.data['notif'] ?? " ");
    }).toList();
  }

  List<CaseData> _caseListFromSnapshots3(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      if (doc.data['stat'] == '3') {
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
            notif: doc.data['notif'] ?? " ");
      }
    }).toList();
  }

  List<CaseData> _caseListFromSnapshots4(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      if (doc.data['stat'] == '2' || doc.data['stat'] == '7') {
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
            notif: doc.data['notif'] ?? " ");
      }
    }).toList();
  }

  List<CaseData> _caseListFromSnapshots5(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      if (doc.data['stat'] != '4' && doc.data['stat'] != '6') {
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
            notif: doc.data['notif'] ?? " ");
      }
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

  Stream<List<CaseData>> get Cases3 {
    return cases.orderBy('stat').snapshots().map(_caseListFromSnapshots2);
  }

  Stream<List<CaseData>> get Cases4 {
    return cases.orderBy('stat').snapshots().map(_caseListFromSnapshots3);
  }

  Stream<List<CaseData>> get Cases5 {
    return cases.orderBy('stat').snapshots().map(_caseListFromSnapshots4);
  }

  Stream<List<CaseData>> get Cases6 {
    return cases.orderBy('stat').snapshots().map(_caseListFromSnapshots5);
  }
}
