import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:everlink_lottery_app/domain/entity/payment.dart';
import 'package:everlink_lottery_app/locator.dart';
import 'package:everlink_lottery_app/utils/nanoid_generator.dart';
import 'package:flutter/foundation.dart';

class FirebasePaymentRepository {
  final FirebaseFirestore _firebaseFirestore = locator<FirebaseFirestore>();

  // time limit constant
  static const timeLimit = Duration(seconds: 10);

  Future<CollectionReference<Object?>> paymentTicketCollectionRef() async {
    return _firebaseFirestore.collection("payments");
  }

  Future<Either<String, Payment>> create({
    required String imageUrl,
    required String paymentMethod,
    required String phoneNumber,
    required bool isApproved,
    required String ticketId,
  }) async {
    try {
      var payment = Payment(
          id: nanoId(),
          imageUrl: imageUrl,
          paymentMethod: paymentMethod,
          phoneNumber: phoneNumber,
          isApproved: isApproved,
          ticketId: ticketId);
      var docRef = await paymentTicketCollectionRef();
      await docRef.doc(payment.id).set(payment.toMap());
      return right(payment);
    } catch (e) {
      debugPrint('Register Error: $e');
      // return left('Register Error: $e');
      return left("Error Adding Lottery");
    }
  }

  Future<Either<String, List<Payment>>> get() async {
    try {
      var collection = await paymentTicketCollectionRef();
      var query = await collection.get().timeout(timeLimit);
      var docs = query.docs;

      List<Payment> lottery = docs.map((doc) {
        return Payment.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      return right(lottery);
    } catch (error) {
      return left(error.toString());
    }
  }
}
