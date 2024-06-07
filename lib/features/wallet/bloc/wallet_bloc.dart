import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';
import 'package:money_manager/core/wallet/domain/usecases/add_wallet.dart';
import 'package:money_manager/core/wallet/domain/usecases/get_all_wallets.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc({required AddWallet addwallet, required GetWallets getWallets})
      : _addWallet = addwallet,
        _getWallets = getWallets,
        super(WalletInitial()) {
    on<CreatWalletEvent>(_createWalletHandler);
    on<GetWalletsEvents>(_getWalletsHandler);
  }
  final AddWallet _addWallet;
  final GetWallets _getWallets;

  Future<void> _createWalletHandler(
      CreatWalletEvent event, Emitter<WalletState> emit) async {
    emit(CreatingNewWalletState());
    final result = await _addWallet(AddWalletParams(
        addBalance: event.addBalance,
        currency: event.currency,
        accountName: event.accountName,
        accountNumber: event.accountNumber,
        accountType: event.accountType,
        colorHex: event.colorHex,
        iconPath: event.iconPath, amount: event.amount));
    result.fold((l) => emit(WalletsErrorState("erreur")),
        (r) => emit(CreatingNewWalletState()));
  }

  Future<void> _getWalletsHandler(
      GetWalletsEvents event, Emitter<WalletState> emit) async {
    emit(GettingWalletState());
    final result = await _getWallets();
    result.fold((l) => emit(WalletsErrorState("erreur")),
        (r) => emit(WalletsGettedState(r)));
  }
}
