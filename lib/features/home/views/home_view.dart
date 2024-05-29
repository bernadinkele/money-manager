import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/app/routes/routes_name.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';
import 'package:money_manager/features/home/screens/custom_appbar.dart';
import 'package:money_manager/features/home/screens/network_screen.dart';
import 'package:money_manager/features/home/screens/wallet_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, getHeight(56)),
          child: CustomAppBar(
            onTap: () => Navigator.pushNamed(context, RoutesNames.addWallet),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
        child: Column(
          children: [
            const Gap(26),
            const NetWorkScreen(),
            const Gap(24),
            SizedBox(
              height: getHeight(176),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AssetsIcons.major),
                      const Gap(10),
                      Text(
                        "Major expenses",
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF000000),
                            fontSize: getFontSize(16)),
                      ),
                    ],
                  ),
                  const Gap(16),
                ],
              ),
            ),
            const Gap(24),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(getFontSize(8))),
              child: Column(
                children: List.generate(3, (index) => const WalletTile()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
