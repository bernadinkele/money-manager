import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/desing_system/components/default_button.dart';
import 'package:money_manager/desing_system/components/default_dropdown.dart';
import 'package:money_manager/desing_system/components/default_numberfield.dart';
import 'package:money_manager/desing_system/components/default_textfield.dart';
import 'package:money_manager/desing_system/components/secondary_appbar.dart';
import 'package:money_manager/features/home/screens/wallet_tile.dart';

class AddWalletView extends StatefulWidget {
  const AddWalletView({super.key});

  @override
  State<AddWalletView> createState() => _AddWalletViewState();
}

class _AddWalletViewState extends State<AddWalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, getHeight(56)),
          child: SecondaryCustomAppBar(
            onTap: () => Navigator.pop(context),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
              decoration: const BoxDecoration(color: Colors.white),
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
              child: const Column(
                children: [
                  Gap(24),
                  DefaultTextField(),
                  Gap(12),
                  DefaultTextField(),
                  Gap(12),
                  Row(
                    children: [
                      Expanded(child: DefaultDropDown()),
                      Gap(12),
                      Expanded(child: DefaultDropDown())
                    ],
                  ),
                  Gap(12),
                  DefaultTextField(),
                  Gap(12),
                  DefaultDropDown(),
                  Gap(12),
                  DefaultDropDown(),
                  Gap(12),
                  DefaultNumberField(),
                  Gap(12),
                  DefaultButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
