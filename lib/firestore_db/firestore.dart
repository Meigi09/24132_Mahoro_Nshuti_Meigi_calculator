import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  final CollectionReference calcs=
      FirebaseFirestore.instance.collection('calcs');

  Future<void> addCalc(String query,String ans){
    return calcs.add({
      'query':query,
      'answer':ans,
    'timestamp':Timestamp.now(),

  });
  }
}