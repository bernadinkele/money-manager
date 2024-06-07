part of 'wallet_bloc.dart';

@immutable
sealed class WalletState {}

final class WalletInitial extends WalletState {}

class CreatingNewWalletState extends WalletState {}

class WalletCreatedState extends WalletState {}

class GettingWalletState extends WalletState {}

// ignore: must_be_immutable
class WalletsGettedState extends WalletState {
  List<Wallet> wallets;
  WalletsGettedState(this.wallets);
}

class WalletsErrorState extends WalletState {
  final String message;
  WalletsErrorState(this.message);
}
