import 'package:everlink_lottery_app/data/remote_repository/firebase_entry_repository.dart';
import 'package:everlink_lottery_app/domain/entity/entry_ticket.dart';
import 'package:everlink_lottery_app/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entry_ticket_provider.g.dart';

@riverpod
Future<List<EntryTicket>> selectedEntryTickets(SelectedEntryTicketsRef ref,
    {required String lotteryId}) async {
  final FirebaseEntryTicketRepository _entryTicketRepository =
      locator<FirebaseEntryTicketRepository>();
  var entries = await _entryTicketRepository.get(lotteryId);
  return entries.fold((error) {
    return [];
  }, (newEntries) => newEntries);
}

// @riverpod
// class EntryTicketsNotifier extends _$EntryTicketsNotifier {
//   final FirebaseEntryTicketRepository _entryTicketRepository =
//       locator<FirebaseEntryTicketRepository>();
//   @override
//   Future<List<EntryTicket>> build({required String lotteryId}) async {
//     var entries = await _entryTicketRepository.get(lotteryId);
//     return entries.fold((error) {
//       return [];
//     }, (newEntries) => newEntries);
//   }
// }

