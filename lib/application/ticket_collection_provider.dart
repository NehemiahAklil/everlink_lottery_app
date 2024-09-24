import 'package:everlink_lottery_app/data/remote_repository/firebase_furniture_repository.dart';
import 'package:everlink_lottery_app/data/remote_repository/firebase_lottery_repository.dart';
import 'package:everlink_lottery_app/domain/entity/furniture.dart';
import 'package:everlink_lottery_app/domain/entity/lottery.dart';
import 'package:everlink_lottery_app/domain/entity/ticket.dart';
import 'package:everlink_lottery_app/domain/value_objects/furniture_type.dart';
import 'package:everlink_lottery_app/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'ticket_collection_provider.g.dart';

@riverpod
class TicketCollectionNotifier extends _$TicketCollectionNotifier {
  final FirebaseFurnitureRepository _furnitureRepository =
      locator<FirebaseFurnitureRepository>();
  final FirebaseLotteryRepository _lotteryRepository =
      locator<FirebaseLotteryRepository>();

  @override
  Future<List<Ticket>> build() async {
    List<Ticket> tickets = [];

    var lottery = await _lotteryRepository.get();

    return lottery.fold((error) {
      debugPrint(error);
      return [];
    }, (lotteries) async {
      for (Lottery lottery in lotteries) {
        var furniture =
            await _furnitureRepository.getOne(lottery.furnitureId ?? "");
        Furniture? lotteryFurniture =
            furniture.fold((error) => null, (value) => value);

        tickets.add(Ticket(
            lotteryId: lottery.id,
            furnitureId: lotteryFurniture?.id ?? "",
            name: lotteryFurniture?.name ?? "",
            imageUrl: lotteryFurniture?.imageUrl ?? "",
            category:
                lotteryFurniture?.category ?? FurnitureType.kitchenCabinet,
            endDate: lottery.endDate,
            startDate: lottery.startDate,
            participants: lottery.participants,
            price: lottery.price));
      }
      return tickets;
    });
  }
}
