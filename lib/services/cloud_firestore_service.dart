import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/firebase_model/cards_firebase_model.dart';
import '../models/old_card_model/old_card_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<CardsModel?> getCardData(String documentId) async {
  final DocumentSnapshot documentSnapshot = await _firestore.collection('cards').doc(documentId).get();

  if (documentSnapshot.exists) {
    final documentData = documentSnapshot.data() as Map<String, dynamic>?;

    if (documentData != null) {
      final card = CardsModel.fromJson(documentData);
      return card;
    }
  } else {}
  return null;
}

Future<CardsModel?> getBarData(String documentId) async {
  final DocumentSnapshot documentSnapshot = await _firestore.collection('bars').doc(documentId).get();

  if (documentSnapshot.exists) {
    final documentData = documentSnapshot.data() as Map<String, dynamic>?;

    if (documentData != null) {
      final bar = CardsModel.fromJson(documentData);
      return bar;
    }
  } else {}
  return null;
}

Future<void> setCardsData({
  required String? documentID,
  required String? tagId,
  required String type,
}) async {
  final firestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference = firestore.collection('authenticity_check');

  final customDocumentId = documentID;

  final card = OldCardModel(
    address: documentID,
    nfcId: tagId,
    type: type,
  );
  final DocumentReference documentReference = firestore.collection('cards').doc(customDocumentId);

  try {
    final documentSnapshot = await documentReference.get();
    if (documentSnapshot.exists) {
      log('Card exists');
    } else {
      final customDocumentRef = collectionReference.doc(customDocumentId);

      final cardMap = card.toJson();

      await customDocumentRef.set(cardMap);
    }
  } catch (e) {
    log('Error checking document existence: $e');
  }
}
