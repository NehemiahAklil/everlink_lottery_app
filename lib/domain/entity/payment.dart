import 'package:cloud_firestore/cloud_firestore.dart';

class Payment {
  Payment(
      {required this.imageUrl,
      required this.paymentMethod,
      required this.phoneNumber,
      required this.isApproved,
      required this.ticketId,
      required this.id,
      Timestamp? creationTime}) {
    createdAt = creationTime ?? Timestamp.now();
  }

  final String id;
  final String imageUrl;
  final String ticketId;
  final String paymentMethod;
  final String phoneNumber;
  final bool isApproved;
  late Timestamp createdAt;

  factory Payment.fromFirestore(Map<String, dynamic> firestoreData) {
    return Payment(
        id: firestoreData['id'],
        imageUrl: firestoreData['imageUrl'],
        paymentMethod: firestoreData['paymentMethod'],
        phoneNumber: firestoreData['phoneNumber'],
        isApproved: firestoreData['isApproved'],
        ticketId: firestoreData['ticketId']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'paymentMethod': paymentMethod,
      'phoneNumber': phoneNumber,
      'isApproved': isApproved,
      'createdAt': createdAt,
      'ticketId': ticketId
    };
  }
}
