/*mport 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vet_app/audio.dart';

class AudioBaseService {
  String auid;

  AudioBaseService({this.auid});

  final CollectionReference audios = Firestore.instance.collection('Audios');

  Future UploadAudio(String uid, Recording recording) async {
    String auid = audios.document().documentID;
    return await audios.document(auid).setData({
      'auid': auid,
      'uid': uid,
      'recording': recording,
    });
  }

  AudioData _audioDataFromSnapshot(DocumentSnapshot snapshot) {
    return AudioData(
        auid: auid,
        uid: snapshot.data['uid'],
        recording: snapshot.data['recording']);
  }

  List<AudioData> _audioListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return AudioData(
        uid: doc.data['uid'] ?? '',
        auid: doc.data['auid'] ?? '',
        recording: doc.data['recording'] ?? '',
      );
    }).toList();
  }

  Stream<AudioData> get audio {
    return audios.document(auid).snapshots().map(_audioDataFromSnapshot);
  }

  Stream<List<AudioData>> get Audios {
    return audios.snapshots().map(_audioListFromSnapshots);
  }
}*/
