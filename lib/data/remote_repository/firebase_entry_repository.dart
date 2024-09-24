import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:everlink_lottery_app/domain/entity/entry_ticket.dart';
import 'package:everlink_lottery_app/locator.dart';
import 'package:flutter/foundation.dart';

class FirebaseEntryTicketRepository {
  final FirebaseFirestore _firebaseFirestore = locator<FirebaseFirestore>();

  // time limit constant
  static const timeLimit = Duration(seconds: 10);

  Future<CollectionReference<Object?>> entryTicketCollectionRef() async {
    return _firebaseFirestore.collection("entry_tickets");
  }

  Future<Either<String, EntryTicket>> create({
    required int id,
    required String lotteryId,
    required String userId,
  }) async {
    bool success = false;
    try {
      var entry =
          EntryTicket(id: id.toString(), lotteryId: lotteryId, userId: userId);
      var docRef = await entryTicketCollectionRef();
      await docRef.doc(entry.id).set(entry.toMap());
      return right(entry);
    } catch (e) {
      debugPrint('Register Error: $e');
      // return left('Register Error: $e');
      return left("Error Adding Lottery");
    }
  }

  Future<Either<String, List<EntryTicket>>> get(String lotteryId) async {
    try {
      var collection = await entryTicketCollectionRef();
      var query = await collection
          .where("lotteryId", isEqualTo: lotteryId)
          .get()
          .timeout(timeLimit);
      var docs = query.docs;

      List<EntryTicket> entries = docs.map((doc) {
        return EntryTicket.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      return right(entries);
    } catch (error) {
      return left(error.toString());
    }
  }
}
