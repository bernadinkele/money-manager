import 'package:isar/isar.dart';
import 'package:money_manager/core/expenses/domain/entities/expense.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';

abstract class ExpenseLocalDatasource {
  Future<List<Expense>> getExpenses();
  Future<void> createExpense(
      {required double amount,
      required Wallet wallet,
      required CategoryEntity category,  required String expenseName, required  DateTime createdAt});
}

class ExpensesLocalDataSourceImpl extends ExpenseLocalDatasource {
  final Isar _isar;

  ExpensesLocalDataSourceImpl(this._isar);
  @override
  Future<void> createExpense(
      {required double amount,
      required Wallet wallet,
      required CategoryEntity category, required String expenseName, required  DateTime createdAt}) async {
    final expense = Expense();
    expense.amount = amount;
    expense.category.value = category ;
    expense.wallet.value = wallet;
    expense.expenseName= expenseName;
    expense.createAt = createdAt;

    await _isar.writeTxn(()async {
      await _isar.expenses.put(expense);
      await expense.wallet.save();
      await expense.category.save();
    },);
  }

  @override
  Future<List<Expense>> getExpenses() async {
    return await _isar.expenses.where().findAll();
  }
}
