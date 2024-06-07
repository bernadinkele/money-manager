import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/wallet/data/datasources/wallet_local_data_source.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';
import 'package:money_manager/core/wallet/domain/repositories/wallet_respository.dart';

class WalletRepositoryImpl extends WalletRepository {
  final WalletLocalDataSource _dataSource;
  WalletRepositoryImpl(this._dataSource);
  @override
  ResultFuture<void> addWallet(
      {required String accountName,
      required double accountNumber,
      required String iconPath,
      required int colorHex,
      required String accountType,
      required String currency,
      required bool addBalance, required double amount}) async {
    try {
      _dataSource.addWallet(
          accountName: accountName,
          accountNumber: accountNumber,
          iconPath: iconPath,
          colorHex: colorHex,
          accountType: accountType,
          currency: currency,
          amount: amount,
          addBalance: addBalance);
      return const Right(null);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<void> deleteWallet({required Id id}) {
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<Wallet>> getAllWallets() async {
    try {
      final result = await _dataSource.getAllWallets();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Wallet> getWallet({required Id id}) {
    throw UnimplementedError();
  }

  @override
  Future<Wallet> updateWallet({required Id id}) {
    throw UnimplementedError();
  }
}
