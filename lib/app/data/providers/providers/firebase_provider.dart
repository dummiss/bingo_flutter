import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  final games = FirebaseFirestore.instance.collection('games');


  Future create(Map<String, dynamic> data) async {
    DocumentReference result = await games.add(data); //.add=.doc().set()
    return result;
  }

  Future update(
      {required String gameId, required Map<String, dynamic> data}) async {
    await games.doc(gameId).update(data);
  }

  Stream<DocumentSnapshot<Object?>> read(String gameId) {
    return games.doc(gameId).snapshots();
  }


  Future delete() async {}
}
