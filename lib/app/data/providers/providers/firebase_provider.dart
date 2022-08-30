import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseProvider {
  late FirebaseFirestore db = FirebaseFirestore.instance;

  Future create(Map<String, dynamic> data) async {
    DocumentReference result =
        await db.collection('game').add(data); //.add=.doc().set()
    return result;
  }

  Future read(data) async {
    FirebaseFirestore.instance.collection('game');
    final snapshot = await data.get();
  }

  Future update (
      {required String gameId, required Map<String, dynamic> data}) async {
    await db.collection('game').doc(gameId).update(data);
  }

  Future delete() async {}
}
