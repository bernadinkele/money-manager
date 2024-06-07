import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/desing_system/components/default_dropdown.dart';
import 'package:money_manager/desing_system/components/secondary_appbar.dart';
import 'package:money_manager/features/home/screens/wallet_tile.dart';
import 'package:money_manager/features/wallet/widgets/calculator_card.dart';

import '../../wallet/utils/utils.dart';

class AddNewExpense extends StatelessWidget {
  const AddNewExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: Column(
        children: [
          const SecondaryCustomAppBar(title: "New expense"),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: getHeight(4)),
            color: Colors.white,
            child: Center(
              child: Text(
                "Thursday, September 21, 2023",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF000000),
                    fontSize: getFontSize(14)),
              ),
            ),
          ),
          Spacer(),
          Text(
            "XOF",
            style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
                color: const Color(0xFF434A51),
                fontSize: getFontSize(24)),
          ),
          const Gap(8),
          Text(
            "8,000",
            style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: getFontSize(64)),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: getHeight(12), horizontal: getWidth(24)),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From account",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF006AE0),
                      fontSize: getFontSize(14)),
                ),
                const Gap(8),
                //const WalletTile(),
                const Gap(24),
                Text(
                  "To Category",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF006AE0),
                      fontSize: getFontSize(14)),
                ),
                const Gap(8),
                // const DefaultDropDown()
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(8), vertical: getHeight(16)),
              child: Wrap(
                children: calculatorCardsContents
                    .map((calculate) => IntrinsicWidth(
                          child: CalculatorCard(
                            calculatorType: calculate,
                          ),
                        ))
                    .toList(),
              )),
        ],
      ),
    );
  }
}

/*
SizedBox(
                height: getHeight(50),
                child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    children: calculatorCardsContents
                        .skip(15)
                        .take(4)
                        .map((e) => CalculatorCard(calculatorType: e))
                        .toList()),
              )
 */
