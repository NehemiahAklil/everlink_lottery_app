import 'package:cloud_firestore/cloud_firestore.dart';

class Payment {
  Payment(
      {required this.id,
      required this.lotteryId,
      required this.userId,
      Timestamp? creationTime}) {
    createdAt = creationTime ?? Timestamp.now();
  }

  final String id;
  final String lotteryId;
  final String userId;
  late Timestamp createdAt;

  factory EntryTicket.fromFirestore(Map<String, dynamic> firestoreData) {
    return EntryTicket(
      id: firestoreData['id'],
      lotteryId: firestoreData['lotteryId'],
      userId: firestoreData['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'lotteryId': lotteryId,
      'userId': userId,
      'createdAt': createdAt,
    };
  }
}
