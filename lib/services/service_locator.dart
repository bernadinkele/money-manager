import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:money_manager/core/expenses/data/datasources/expense_local_datasource.dart';
import 'package:money_manager/core/expenses/data/repositories/expense_repository_impl.dart';
import 'package:money_manager/core/expenses/domain/repositories/expense_repository.dart';
import 'package:money_manager/core/expenses/domain/usecases/create_expense.dart';
import 'package:money_manager/core/expenses/domain/usecases/get_expenses.dart';
import 'package:money_manager/core/wallet/data/datasources/category_local_data_source.dart';
import 'package:money_manager/core/wallet/data/datasources/wallet_local_data_source.dart';
import 'package:money_manager/core/wallet/data/repositories/category_repository_impl.dart';
import 'package:money_manager/core/wallet/data/repositories/wallet_repository_implements.dart';
import 'package:money_manager/core/wallet/domain/repositories/category_repository.dart';
import 'package:money_manager/core/wallet/domain/repositories/wallet_respository.dart';
import 'package:money_manager/core/wallet/domain/usecases/add_category.dart';
import 'package:money_manager/core/wallet/domain/usecases/add_wallet.dart';
import 'package:money_manager/core/wallet/domain/usecases/get_all_categories.dart';
import 'package:money_manager/core/wallet/domain/usecases/get_all_wallets.dart';
import 'package:money_manager/features/expenses/bloc/category_bloc/category_bloc.dart';
import 'package:money_manager/features/expenses/bloc/expense_bloc/expense_bloc.dart';
import 'package:money_manager/features/wallet/bloc/wallet_bloc.dart';

final sl = GetIt.instance;

Future<void> initGetIt(Isar isar) async {
  //wallet
  sl
    ..registerFactory(
      () => WalletBloc(addwallet: sl(), getWallets: GetWallets(sl())),
    )
    ..registerLazySingleton(() => AddWallet(sl()))
    ..registerLazySingleton<WalletRepository>(() => WalletRepositoryImpl(sl()))
    ..registerLazySingleton<WalletLocalDataSource>(
        () => WalletLocalDataSourceImplements(isar));

  //category
  sl
    ..registerFactory(
      () => CategoryBloc(addCategory: sl(), getCategories: GetCategories(sl())),
    )
    ..registerLazySingleton(
      () => AddCategory(sl()),
    )
    ..registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(sl()),
    )
    ..registerLazySingleton<CategoryLocalDataSource>(
      () => CategoryLocalDataSourceImpl(isar),
    );

  //expense
  sl
    ..registerFactory(
      () => ExpenseBloc(createExpense: sl(), getExpenses: GetExpenses(sl())),
    )
    ..registerLazySingleton(
      () => CreateExpense(sl()),
    )
    ..registerLazySingleton<ExpenseRepository>(
      () => ExpenseRepositoryImpl(sl()),
    )
    ..registerLazySingleton<ExpenseLocalDatasource>(
      () => ExpensesLocalDataSourceImpl(isar),
    );
}
