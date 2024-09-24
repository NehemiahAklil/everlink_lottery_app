import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:everlink_lottery_app/domain/entity/lottery.dart';
import 'package:everlink_lottery_app/locator.dart';
import 'package:everlink_lottery_app/utils/helper.dart';
import 'package:everlink_lottery_app/utils/nanoid_generator.dart';
import 'package:flutter/foundation.dart';

class FirebaseLotteryRepository {
  final FirebaseFirestore _firebaseFirestore = locator<FirebaseFirestore>();

  // time limit constant
  static const timeLimit = Duration(seconds: 10);

  Future<CollectionReference<Object?>> lotteryCollectionRef() async {
    return _firebaseFirestore.collection("lottery");
  }

  Future<Either<String, Lottery>> create(
      {required int participants,
      required String furnitureId,
      required int price,
      required String startDate,
      required String endDate}) async {
    bool success = false;
    try {
      var lottery = Lottery(
        id: nanoId(),
        participants: participants,
        furnitureId: furnitureId,
        price: price,
        startDate: DateTime.parse(startDate),
        endDate: DateTime.parse(endDate),
        winnerId: pickRandomWinner(participants),
      );
      var docRef = await lotteryCollectionRef();
      await docRef.doc(lottery.id).set(lottery.toMap());
      return right(lottery);
    } catch (e) {
      debugPrint('Register Error: $e');
      // return left('Register Error: $e');
      return left("Error Adding Lottery");
    }
  }

  Future<Either<String, List<Lottery>>> get() async {
    try {
      var collection = await lotteryCollectionRef();
      var query = await collection.get().timeout(timeLimit);
      var docs = query.docs;

      List<Lottery> lottery = docs.map((doc) {
        return Lottery.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      return right(lottery);
    } catch (error) {
      return left(error.toString());
    }
  }
}
