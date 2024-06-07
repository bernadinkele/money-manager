import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:money_manager/core/wallet/data/datasources/wallet_local_data_source.dart';
import 'package:money_manager/core/wallet/data/repositories/wallet_repository_implements.dart';
import 'package:money_manager/core/wallet/domain/repositories/wallet_respository.dart';
import 'package:money_manager/core/wallet/domain/usecases/add_wallet.dart';
import 'package:money_manager/core/wallet/domain/usecases/get_all_wallets.dart';
import 'package:money_manager/features/wallet/bloc/wallet_bloc.dart';

final sl = GetIt.instance;

Future<void> initGetIt(Isar isar) async {
  sl
    ..registerFactory(
      () =>
          WalletBloc(addwallet: sl(), getWallets: GetWallets( sl())),
    )
    ..registerLazySingleton(() => AddWallet(sl()))
    ..registerLazySingleton<WalletRepository>(() => WalletRepositoryImpl(sl()))
    ..registerLazySingleton<WalletLocalDataSource>(
        () => WalletLocalDataSourceImplements(isar));
}
