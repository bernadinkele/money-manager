import 'package:dartz/dartz.dart';
import 'package:money_manager/core/expenses/data/datasources/expense_local_datasource.dart';
import 'package:money_manager/core/expenses/domain/entities/expense.dart';
import 'package:money_manager/core/expenses/domain/repositories/expense_repository.dart';
import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';

class ExpenseRepositoryImpl extends ExpenseRepository {
  final ExpenseLocalDatasource _datasource;
  ExpenseRepositoryImpl(this._datasource);
  @override
  ResultFuture<void> createExpense(
      {required double amount,
      required Wallet wallet,
      required CategoryEntity category,
      required String expenseName,
      required DateTime createdAt}) async {
    try {
      await _datasource.createExpense(
          amount: amount,
          wallet: wallet,
          category: category,
          expenseName: expenseName,
          createdAt: createdAt);
      return const Right(null);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  ResultFuture<List<Expense>> getExpenses() async {
    try {
      final result = await _datasource.getExpenses();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
