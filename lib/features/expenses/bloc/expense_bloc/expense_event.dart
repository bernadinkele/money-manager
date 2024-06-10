part of 'expense_bloc.dart';

@immutable
sealed class ExpenseEvent {}

class GetExpensesEvent extends ExpenseEvent {}

class CreateExpenseEvent extends ExpenseEvent {
  final double amount;
  final Wallet wallet;
  final CategoryEntity category;
  final DateTime createAt;
  final String expenseName;
  CreateExpenseEvent(
      {required this.wallet,
      required this.category,
      required this.amount,
      required this.expenseName,
      required this.createAt});
}
