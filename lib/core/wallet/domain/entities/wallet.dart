import 'package:isar/isar.dart';

part 'wallet.g.dart';

@collection
class Wallet {
  Id id = Isar.autoIncrement;
  String? accountName;
  double? accountNumber;
  String? iconPath;
  int? colorHex;
  String? accountType;
  String? currency;
  bool? addBalance;
  double? amount;
}
