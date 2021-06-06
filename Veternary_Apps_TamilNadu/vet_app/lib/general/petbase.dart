import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_app/general/petclass.dart';

class PetBaseService {
  final String puid;
  PetBaseService({this.puid});
  final CollectionReference pets = Firestore.instance.collection('Pets');
  final CollectionReference dpets = Firestore.instance.collection('DummyPets');

  Future initializePetData(String uid, String name, String species,
      String breed, String history, String year) async {
    String puid2 = pets.document().documentID;
    return await pets.document(puid2).setData({
      'puid': puid2,
      'uid': uid,
      'name': name,
      'species': species,
      'breed': breed,
      'history': history,
      'year': year,
    });
  }

  String randomPuid() {
    String puid2 = pets.document().documentID;
    return puid2;
  }

  Future initializeDPetData(String uid, String species, String breed,
      String history, String year, int animalnumber) async {
    return await dpets.document(puid).setData({
      'puid': puid,
      'uid': uid,
      'species': species,
      'breed': breed,
      'history': history,
      'year': year,
      'animalnumber': animalnumber,
    });
  }

  Future updatePetData(String history) async {
    return await pets.document(puid).updateData({
      'history': history,
    });
  }

  PetData _petDataFromSnapshot(DocumentSnapshot snapshot) {
    return PetData(
      puid: puid,
      uid: snapshot.data['uid'],
      name: snapshot.data['name'],
      species: snapshot.data['species'],
      breed: snapshot.data['breed'],
      history: snapshot.data['history'],
      year: snapshot.data['year'],
      animalnumber: snapshot.data['animalnumber'],
    );
  }

  List<PetData> _petListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return PetData(
        uid: doc.data['uid'] ?? '',
        puid: doc.data['puid'] ?? '',
        breed: doc.data['breed'] ?? '',
        history: doc.data['history'] ?? '',
        name: doc.data['name'] ?? doc.data['species'],
        species: doc.data['species'] ?? '',
        year: doc.data['year'] ?? '',
        animalnumber: doc.data['animalnumber'] ?? '0',
      );
    }).toList();
  }

  Stream<PetData> get petData {
    return pets.document(puid).snapshots().map(_petDataFromSnapshot);
  }

  Stream<List<PetData>> get Pets {
    return pets.orderBy('species').snapshots().map(_petListFromSnapshots);
  }
}
