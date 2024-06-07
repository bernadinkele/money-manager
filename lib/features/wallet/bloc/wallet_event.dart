part of 'wallet_bloc.dart';

@immutable
sealed class WalletEvent {}

class CreatWalletEvent extends WalletEvent {
  CreatWalletEvent(
      {required this.accountName,
      required this.accountNumber,
      required this.accountType,
      required this.addBalance,
      required this.colorHex,
      required this.iconPath,
      required this.currency, required this.amount});
  final String accountName;
  final double accountNumber;
  final String iconPath;
  final int colorHex;
  final String accountType;
  final String currency;
  final bool addBalance;
  final double amount;
}

class GetWalletsEvents extends WalletEvent {}
