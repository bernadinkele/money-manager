import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_manager/core/expenses/domain/usecases/create_expense.dart';
import 'package:money_manager/core/expenses/domain/usecases/get_expenses.dart';
import 'package:money_manager/core/wallet/domain/entities/category_entity.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';

import '../../../../core/expenses/domain/entities/expense.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc(
      {required CreateExpense createExpense, required GetExpenses getExpenses})
      : _createExpense = createExpense,
        _getExpenses = getExpenses,
        super(ExpenseInitial()) {
    on<CreateExpenseEvent>(_createExpenseHandler);
    on<GetExpensesEvent>(_getExpenseHandler);
  }

  final CreateExpense _createExpense;
  final GetExpenses _getExpenses;

  Future<void> _createExpenseHandler(
      CreateExpenseEvent event, Emitter<ExpenseState> emit) async {
    emit(CreatingExpenseState());
    final result = await _createExpense(CreateExpenseParams(
        wallet: event.wallet, category: event.category, amount: event.amount, createdAt: event.createAt, expenseName: event.expenseName));

    result.fold(
      (l) => emit(ExpensesErrorState()),
      (r) => emit(NewExpenseCreatedState()),
    );
  }

  Future<void> _getExpenseHandler(
      GetExpensesEvent event, Emitter<ExpenseState> emit) async {
    emit(CreatingExpenseState());
    final result = await _getExpenses();

    result.fold(
      (l) => emit(ExpensesErrorState()),
      (r) => emit(ExpensesGettedState(r)),
    );
  }
}
