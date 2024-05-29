import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';
import 'package:money_manager/features/home/screens/wallet_tile.dart';

class AddWalletView extends StatelessWidget {
  const AddWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, getHeight(56)),
          child: SecondaryCustomAppBar(
            onTap: () => Navigator.pop(context),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(
           padding:EdgeInsets.symmetric(horizontal: getWidth(24)),
           decoration: const BoxDecoration(
             color: Colors.white
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Gap(12),
               Text(
                 "Preview",
                 style: TextStyle(
                     fontFamily: "Nunito",
                     fontWeight: FontWeight.w500,
                     color: const Color(0xFF006AE0),
                     fontSize: getFontSize(14)),
               ),
               const Gap(8),
               const WalletTile(),
               const Gap(12)
             ],
           ),
         )
        ],
      ),
    );
  }
}

class SecondaryCustomAppBar extends StatelessWidget {
  const SecondaryCustomAppBar({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
              horizontal: getWidth(24), vertical: getHeight(10))
          .copyWith(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xFFDADCE0)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: onTap, child: SvgPicture.asset(AssetsIcons.close)),
          Text(
            "New wallet",
            style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
                fontSize: getFontSize(18)),
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
