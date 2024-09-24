import 'package:nanoid/nanoid.dart';

String nanoId() {
  String alphabet =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  return customAlphabet(alphabet, 20);
}
