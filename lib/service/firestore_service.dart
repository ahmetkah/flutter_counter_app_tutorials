import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();
  final firestoreInstance = FirebaseFirestore.instance;
  final collectionPath = 'counter';
  final documentPath = 'first';

  /// Veriyi Dokümana YAZ
  Future<void> setValue({
    required int value,
  }) async {
    /// CollectionReference
    final reference = firestoreInstance.collection(collectionPath);
    final data = <String, dynamic>{'value': value};
    await reference.doc(documentPath).set(data);
  }

  /// Veriyi GÜNCELLE
  Future<void> updateValue({
    required int value,
  }) async {
    /// CollectionReference
    final reference = firestoreInstance.collection(collectionPath);
    final data = <String, dynamic>{'value': value};
    await reference.doc(documentPath).update(data);
  }

  /// Veriyi Dokümandan SİL
  Future<void> deleteValue() async {
    /// DocumentReference
    final reference = firestoreInstance.collection(collectionPath).doc(documentPath);
    await reference.delete();
  }

  /// Collection Stream - Realtime Changes
  Stream<QuerySnapshot> collectionValueStream<T>() {
    /// CollectionReference
    final reference = firestoreInstance.collection(collectionPath);

    /// QuerySnapshot: Akıştan dönen veriyi taşıyan obje
    final snapshots = reference.snapshots();
    return snapshots;
  }
}
