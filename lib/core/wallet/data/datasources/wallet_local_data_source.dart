import 'package:isar/isar.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';

abstract class WalletLocalDataSource {
  Future<List<Wallet>> getAllWallets();
  Future<void> addWallet(
      {required String accountName,
      required double accountNumber,
      required String iconPath,
      required int colorHex,
      required String accountType,
      required String currency,
      required bool addBalance,
      required double amount});
  Future<void> deleteWallet({required Id id});
  Future<Wallet> updateWallet({required Id id});
  Future<Wallet> getWallet({required Id id});
}

class WalletLocalDataSourceImplements extends WalletLocalDataSource {
  WalletLocalDataSourceImplements(this._isar);
  final Isar _isar;
  @override
  Future<void> deleteWallet({required Id id}) {
    // TODO: implement deleteWallet
    throw UnimplementedError();
  }

  @override
  Future<List<Wallet>> getAllWallets() async {
    final wallets = await _isar.wallets.where().findAll();
    return wallets;
  }

  @override
  Future<Wallet> getWallet({required Id id}) {
    // TODO: implement getWallet
    throw UnimplementedError();
  }

  @override
  Future<Wallet> updateWallet({required Id id}) {
    // TODO: implement updateWallet
    throw UnimplementedError();
  }

  @override
  Future<void> addWallet(
      {required String accountName,
      required double accountNumber,
      required String iconPath,
      required int colorHex,
      required String accountType,
      required String currency,
      required bool addBalance,
      required double amount}) async {
    final newWallet = Wallet();
    newWallet.accountName = accountName;
    newWallet.accountNumber = accountNumber;
    newWallet.iconPath = iconPath;
    newWallet.colorHex = colorHex;
    newWallet.currency = currency;
    newWallet.addBalance = addBalance;
    newWallet.accountType = accountType;
    newWallet.amount = amount;
    await _isar.writeTxn(() async {
      await _isar.wallets.put(newWallet);
    });
  }
}
