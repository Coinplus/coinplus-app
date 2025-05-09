import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/firebase_model/buy_card_model.dart';
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

  try {
    final customDocumentRef = collectionReference.doc(customDocumentId);

    final cardMap = card.toJson();

    await customDocumentRef.set(cardMap);
  } catch (e) {
    log('Error checking document existence: $e');
  }
}

Future<void> toggleActivation(String documentId) async {
  final card = await getCardData(documentId);

  if (card != null) {
    if (card.activated == false) {
      card.activated = true;

      await _firestore.collection('cards').doc(documentId).update({
        'activated': true,
      });
    }
  }
}

Future<void> incrementActivationCount(String documentId) async {
  final card = await getCardData(documentId);

  if (card != null) {
    final currentActivationCount = card.activationCount ?? 0;
    final newActivationCount = currentActivationCount + 1;

    card.activationCount = newActivationCount;

    await _firestore.collection('cards').doc(documentId).update({
      'activationCount': newActivationCount,
    });
  }
}

Future<void> activationFailureCount(String documentId) async {
  final card = await getCardData(documentId);

  if (card != null) {
    final currentActivationFailureCount = card.activationFailureCount ?? 0;
    final newActivationFailureCount = currentActivationFailureCount + 1;

    card.activationFailureCount = newActivationFailureCount;

    await _firestore.collection('cards').doc(documentId).update({
      'activationFailureCount': newActivationFailureCount,
    });
  }
}

Future<void> connectedCount(String documentId) async {
  final card = await getCardData(documentId);

  if (card != null) {
    final connectedCount = card.connected ?? 0;
    final newConnectedCount = connectedCount + 1;

    card.connected = newConnectedCount;

    await _firestore.collection('cards').doc(documentId).update({
      'connected': newConnectedCount,
    });
  }
}

Future<void> updateAppConnectionDate(String documentId) async {
  final card = await getCardData(documentId);
  if (card != null) {
    final timestamp = Timestamp.now();

    await FirebaseFirestore.instance.collection('cards').doc(documentId).update({
      'appConnectionDate': timestamp,
    });
  }
}

Future<void> updateCardActivationDate(String documentId) async {
  final card = await getCardData(documentId);
  if (card != null) {
    final timestamp = Timestamp.now();

    await FirebaseFirestore.instance.collection('cards').doc(documentId).update({
      'activationDate': timestamp,
    });
  }
}

Future<void> deleteCount(String documentId) async {
  final card = await getCardData(documentId);

  if (card != null) {
    final deleteCount = card.deleted ?? 0;
    final newDeleteCount = deleteCount + 1;

    card.deleted = newDeleteCount;

    await _firestore.collection('cards').doc(documentId).update({
      'deleted': newDeleteCount,
    });
  }
}

Future<void> verificationFailureCount(String documentId) async {
  final card = await getCardData(documentId);

  if (card != null) {
    final verificationFailureCount = card.verificationFailureCount ?? 0;
    final newFailureCount = verificationFailureCount + 1;

    card.verificationFailureCount = newFailureCount;

    await _firestore.collection('cards').doc(documentId).update({
      'verificationFailureCount': newFailureCount,
    });
  }
}

Future<void> addBackupAddressToDb({required String mainWalletAddress, required String backupWalletAddress}) async {
  final card = await getCardData(mainWalletAddress);

  if (card != null) {
    await _firestore.collection('cards').doc(mainWalletAddress).update({
      'backupAddress': backupWalletAddress,
    });
  }
}

Future<void> addPrimaryCardAddressToDb({required String mainWalletAddress, required String backupWalletAddress}) async {
  final card = await getCardData(backupWalletAddress);

  if (card != null) {
    await _firestore.collection('cards').doc(backupWalletAddress).update({
      'primaryWalletAddress': mainWalletAddress,
    });
  }
}

Future<void> addPrimaryCardColorToDb({required String mainWalletColor, required String backupWalletAddress}) async {
  final card = await getCardData(backupWalletAddress);

  if (card != null) {
    await _firestore.collection('cards').doc(backupWalletAddress).update({
      'primaryWalletColor': mainWalletColor,
    });
  }
}

Future<void> deletePrimaryWalletColorFromDb({required String backupWalletAddress}) async {
  await FirebaseFirestore.instance.collection('cards').doc(backupWalletAddress).update({
    'primaryWalletColor': FieldValue.delete(),
  });
}

Future<void> deleteBackupAddressFromDb({required String mainWalletAddress}) async {
  await FirebaseFirestore.instance.collection('cards').doc(mainWalletAddress).update({
    'backupAddress': FieldValue.delete(),
  });
}

Future<void> deletePrimaryAddressFromDb({required String backupWalletAddress}) async {
  await FirebaseFirestore.instance.collection('cards').doc(backupWalletAddress).update({
    'primaryWalletAddress': FieldValue.delete(),
  });
}

Future<BuyCardModel?> getBuyCardData() async {
  final DocumentSnapshot documentSnapshot = await _firestore.collection('links').doc('buy_card').get();

  if (documentSnapshot.exists) {
    final documentData = documentSnapshot.data() as Map<String, dynamic>?;

    if (documentData != null) {
      final card = BuyCardModel.fromJson(documentData);
      return card;
    }
  } else {}
  return null;
}

Future<BuyCardModel?> getBuyBackupData() async {
  final DocumentSnapshot documentSnapshot = await _firestore.collection('links').doc('buy_backup').get();

  if (documentSnapshot.exists) {
    final documentData = documentSnapshot.data() as Map<String, dynamic>?;

    if (documentData != null) {
      final card = BuyCardModel.fromJson(documentData);
      return card;
    }
  } else {}
  return null;
}

Future<BuyCardModel?> getBuyCardPlusButtonLink() async {
  final DocumentSnapshot documentSnapshot = await _firestore.collection('links').doc('buy_card_plus_button').get();

  if (documentSnapshot.exists) {
    final documentData = documentSnapshot.data() as Map<String, dynamic>?;

    if (documentData != null) {
      final link = BuyCardModel.fromJson(documentData);
      return link;
    }
  } else {}
  return null;
}

Future<void> updateCardLostStatus({required String cardAddress, required bool? lostStatus}) async {
  final card = await getCardData(cardAddress);
  if (card != null) {
    card.lost = lostStatus;
    await _firestore.collection('cards').doc(cardAddress).update({
      'lost': lostStatus,
    });
  }
}

Future<void> updateCardHasBackupStatus({required String cardAddress, required bool? hasBackupStatus}) async {
  final card = await getCardData(cardAddress);
  if (card != null) {
    await _firestore.collection('cards').doc(cardAddress).update({
      'hasBackup': hasBackupStatus,
    });
  }
}

Future<void> updateCardBackupStatus({required String cardAddress, required bool? backupStatus}) async {
  final card = await getCardData(cardAddress);
  if (card != null) {
    if (card.backup == true || card.backup == null) {
      card.backup = backupStatus;
      await _firestore.collection('cards').doc(cardAddress).update({
        'backup': backupStatus,
      });
    }
  }
}

Future<void> addReplenishmentHistory({
  required String documentId,
  required int amount,
  required String blockchain,
  required String crypto,
  required String currency,
  required int fiatAmount,
}) async {
  final card = await getCardData(documentId);
  final newHistory = <String, dynamic>{
    'amount': amount,
    'blockchain': blockchain,
    'crypto': crypto,
    'currency': currency,
    'date': DateTime.now(),
    'fiatAmount': fiatAmount,
  };
  if (card != null) {
    if (card.replenished == false) {
      card.replenished = true;
      await _firestore.collection('cards').doc(documentId).update({
        'replenished': true,
      });
    }
  }
  try {
    await _firestore.collection('cards').doc(documentId).update({
      'replenishmentHistory': FieldValue.arrayUnion([newHistory]),
    });
  } catch (e) {
    log('Error adding replenishment history: $e');
  }
}
