import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/utils/usecase.dart';
import 'package:money_manager/core/wallet/domain/repositories/wallet_respository.dart';

class AddWallet extends UseCaseWithParams<void, AddWalletParams> {
  final WalletRepository repository;
  const AddWallet(this.repository);

  @override
  ResultFuture<void> call(AddWalletParams params) async => repository.addWallet(
      accountName: params.accountName,
      accountNumber: params.accountNumber,
      iconPath: params.iconPath,
      colorHex: params.colorHex,
      accountType: params.accountType,
      currency: params.currency,
      addBalance: params.addBalance, amount: params.amount);
}

class AddWalletParams {
  final String accountName;
  final double accountNumber;
  final String iconPath;
  final int colorHex;
  final String accountType;
  final String currency;
  final bool addBalance;
  final double amount;
 
  const AddWalletParams(
      {required this.addBalance,
      required this.currency,
      required this.accountName,
      required this.accountNumber,
      required this.accountType,
      required this.colorHex,
      required this.iconPath, required this.amount});
}
