import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;
Reference firebaseStorage = FirebaseStorage.instance.ref();
final qPReference = fireStore.collection('questionPapers');
final userRef = fireStore.collection('users');

DocumentReference questionRef({required paperId, required questionId}) =>
    qPReference.doc(paperId).collection('questions').doc(questionId);
