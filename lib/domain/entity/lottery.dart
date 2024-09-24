import 'package:intl/intl.dart';

class Lottery {
  Lottery(
      {required this.id,
      required this.participants,
      required this.furnitureId,
      required this.price,
      required this.startDate,
      required this.endDate,
      required this.winnerId});

  final String id;
  final String? furnitureId;
  final DateTime startDate;
  final DateTime endDate;
  final int participants;
  final int price;
  final int winnerId;

  factory Lottery.fromFirestore(Map<String, dynamic> firestoreData) {
    return Lottery(
      id: firestoreData['id'],
      furnitureId: firestoreData['furnitureId'],
      participants: firestoreData['participants'],
      price: firestoreData['price'],
      startDate: DateFormat.yMMMd().parse(firestoreData['startDate']),
      endDate: DateFormat.yMMMd().parse(firestoreData['endDate']),
      winnerId: firestoreData['winnerId'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'furnitureId': furnitureId,
      'participants': participants,
      'price': price,
      'startDate': DateFormat.yMMMd().format(startDate),
      'endDate': DateFormat.yMMMd().format(endDate),
      'winnerId': winnerId
    };
  }
}
