import 'package:money_manager/core/expenses/domain/repositories/expense_repository.dart';
import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/utils/usecase.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';

class CreateExpense extends UseCaseWithParams<void, CreateExpenseParams> {
  final ExpenseRepository _repository;
  CreateExpense(this._repository);

  @override
  ResultFuture<void> call(CreateExpenseParams params) async =>
      _repository.createExpense(
          amount: params.amount,
          createdAt: params.createdAt,
          wallet: params.wallet,
          category: params.category, expenseName: params.expenseName);
}

class CreateExpenseParams {
  final double amount;
  final Wallet wallet;
  final CategoryEntity category;
  final DateTime createdAt;
  final String expenseName;
  CreateExpenseParams(
      {required this.wallet,
      required this.category,
      required this.amount,
      required this.createdAt, required this.expenseName});
}
