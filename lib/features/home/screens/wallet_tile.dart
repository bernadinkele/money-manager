import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/core/wallet/domain/entities/wallet.dart';

class WalletTile extends StatelessWidget {
  const WalletTile(
      {super.key, this.activeBorder = false, required this.wallet});
  final bool? activeBorder;
  final Wallet wallet;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: activeBorder != null && activeBorder == true
              ? Border.all(color: const Color(0xFFDADCE0), width: 0.5)
              : null,
          borderRadius: BorderRadius.circular(getFontSize(8))),
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(
            12,
          ),
          vertical: getHeight(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: getFontSize(16),
                    backgroundColor: const Color(0xFFDADCE0),
                    child: SvgPicture.asset(
                      wallet.iconPath!,
                      colorFilter:
                          const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    ),
                  ),
                  const Gap(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wallet.accountName.toString(),
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: getFontSize(14)),
                      ),
                      const Gap(4),
                      Text(
                        wallet.accountNumber.toString(),
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF858C94),
                            fontSize: getFontSize(12)),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(wallet.amount.toString(),
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: getFontSize(18))),
                  const Gap(4),
                  Text(wallet.currency.toString(),
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: getFontSize(9))),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
