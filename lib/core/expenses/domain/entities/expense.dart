import 'package:isar/isar.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';

part 'expense.g.dart';

@collection
class Expense {
  Id id = Isar.autoIncrement;
  double? amount;
  final wallet = IsarLink<Wallet>();
  final category = IsarLink<CategoryEntity>();
  DateTime? createAt;
  String? expenseName;
}
