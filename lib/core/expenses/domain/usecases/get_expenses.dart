import 'package:money_manager/core/expenses/domain/entities/expense.dart';
import 'package:money_manager/core/expenses/domain/repositories/expense_repository.dart';
import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/utils/usecase.dart';

class GetExpenses extends UseCaseWithOutParams<List<Expense>> {
  final ExpenseRepository repository;
  GetExpenses(this.repository);
  @override
  ResultFuture<List<Expense>> call() async => repository.getExpenses();
}
