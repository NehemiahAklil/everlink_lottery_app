import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everlink_lottery_app/data/remote_repository/firebase_auth_repository.dart';
import 'package:everlink_lottery_app/data/remote_repository/firebase_entry_repository.dart';
import 'package:everlink_lottery_app/data/remote_repository/firebase_furniture_repository.dart';
import 'package:everlink_lottery_app/data/remote_repository/firebase_lottery_repository.dart';
import 'package:everlink_lottery_app/data/remote_repository/firebase_payment_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  locator.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);
  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  locator.registerSingleton<FirebaseAuthRepository>(FirebaseAuthRepository());
  locator.registerSingleton<FirebaseEntryTicketRepository>(
      FirebaseEntryTicketRepository());
  locator.registerSingleton<FirebasePaymentRepository>(
      FirebasePaymentRepository());
  locator.registerSingleton<FirebaseLotteryRepository>(
      FirebaseLotteryRepository());
  locator.registerSingleton<FirebaseFurnitureRepository>(
      FirebaseFurnitureRepository());
}
