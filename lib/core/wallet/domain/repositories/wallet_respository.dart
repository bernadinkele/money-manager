import 'package:isar/isar.dart';
import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';

abstract class WalletRepository {
  ResultFuture<List<Wallet>>  getAllWallets();
  ResultFuture<void> addWallet(
      {required String accountName,
      required double accountNumber,
      required String iconPath,
      required int colorHex,
      required String accountType,
      required String currency,
      required bool addBalance, required double amount});
  Future<void> deleteWallet({required Id id});
  Future<Wallet> updateWallet({required Id id});
  Future<Wallet> getWallet({required Id id});
}
