import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_services/app/logger.dart';
import 'package:firebase_services/data/prefiling_data.dart';
import 'package:firebase_services/models/lecture.dart';

class LecturesRepository {
  final FirebaseFirestore _firestore;

  LecturesRepository(this._firestore);

  late final _lectureCollectionRef =
      _firestore.collection('lectures').withConverter(
            fromFirestore: (snapshot, _) => Lecture.fromJson(snapshot.data()!),
            toFirestore: (lesson, _) => lesson.toJson(),
          );

  Stream<List<Lecture>> get lectureStream => _lectureCollectionRef
      .snapshots()
      .map((snapshot) => snapshot.docs.map((e) => e.data()).toList());

  Future<void> fillDatabase() async {
    //* --- qeyri-atomar method (bax: atomic operation) ---
    // for (var lecture in lecturesPrefilingData) {
    //   _lectureCollectionRef.add(lecture);
    // }

    //* atomar metod
    //* set, get imkanı
    //  await _firestore.runTransaction((transaction) async {
    //     for (var lecture in lecturesPrefilingData) {
    //       transaction.set(_lectureCollectionRef.doc(), lecture);
    //     }
    //   });

    //* atomar metod
    //* daha optimallaşdırılmış set
    final batch = _firestore.batch();

    for (var lecture in lecturesPrefilingData) {
      batch.set(_lectureCollectionRef.doc(), lecture);
    }

    await batch.commit();

    logger.d('Filled Database');
  }

  Future<void> clearDatabase() async {
    final lecturesSnapshot = await _lectureCollectionRef.get();

    await _firestore.runTransaction((transaction) async {
      for (var doc in lecturesSnapshot.docs) {
        transaction.delete(doc.reference);
      }
    });

    logger.d('Cleared Database');
  }
}
