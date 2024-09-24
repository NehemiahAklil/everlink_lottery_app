import 'package:everlink_lottery_app/domain/value_objects/furniture_type.dart';

class Ticket {
  Ticket({
    required this.furnitureId,
    required this.lotteryId,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.startDate,
    required this.endDate,
    required this.participants,
    required this.price,
  });

  final String furnitureId;
  final String lotteryId;
  final String name;
  final String imageUrl;
  final FurnitureType category;
  final DateTime startDate;
  final DateTime endDate;
  final int participants;
  final int price;
}
