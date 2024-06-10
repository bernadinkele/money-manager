import 'package:money_manager/core/expenses/domain/entities/expense.dart';
import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';

abstract class ExpenseRepository {
  ResultFuture<List<Expense>> getExpenses();
  ResultFuture<void> createExpense({
    required double amount,
    required Wallet wallet,
    required CategoryEntity category,
    required  DateTime createdAt,
    required String expenseName
  });
}
