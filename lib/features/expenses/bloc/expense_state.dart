part of 'expense_bloc.dart';

@immutable
sealed class ExpenseState {}

final class ExpenseInitial extends ExpenseState {}

class CreatingExpenseState extends ExpenseState {}

class NewExpenseCreatedState extends ExpenseState {}

class GettingExpensesState extends ExpenseState {}

class ExpensesGettedState extends ExpenseState {

}
