import 'package:money_manager/core/utils/typedefs.dart';
import 'package:money_manager/core/utils/usecase.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';
import 'package:money_manager/core/wallet/domain/repositories/wallet_respository.dart';

class GetWallets extends UseCaseWithOutParams<List<Wallet>> {
  final WalletRepository repository;
  const GetWallets(this.repository);
  @override
  ResultFuture<List<Wallet>> call() async => repository.getAllWallets();
}
