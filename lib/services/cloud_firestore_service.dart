import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/firebase_model/cards_firebase_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<CardsModel?> getCardData(String documentId) async {

    final DocumentSnapshot documentSnapshot =
    await _firestore.collection('cards').doc(documentId).get();

    if (documentSnapshot.exists) {
      final documentData = documentSnapshot.data() as Map<String, dynamic>?;

      if (documentData != null) {
        final card = CardsModel.fromJson(documentData);
        return card;
      }
    } else {
    }
    return null;
  }

Future<CardsModel?> getBarData(String documentId) async {

  final DocumentSnapshot documentSnapshot =
  await _firestore.collection('bars').doc(documentId).get();

  if (documentSnapshot.exists) {
    final documentData = documentSnapshot.data() as Map<String, dynamic>?;

    if (documentData != null) {
      final bar = CardsModel.fromJson(documentData);
      return bar;
    }
  } else {
  }
  return null;
}
