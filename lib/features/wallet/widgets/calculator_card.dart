import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';
import 'package:money_manager/features/wallet/utils/utils.dart';

class CalculatorCard extends StatelessWidget {
  const CalculatorCard(
      {super.key, required this.calculatorType, required this.onTap});
  final CalculatorType calculatorType;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: getHeight(60),
        width: calculatorType.$1 == "0"
            ? ((width - 8) * 0.17) * 2 + 8
            : (width - 8) * 0.17,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: calculatorType.$1 != AssetsIcons.check
                ? Colors.white
                : Colors.black,
            borderRadius: BorderRadius.circular(getFontSize(8)),
            border: Border.all(color: const Color(0xFFDADCE0), width: 1)),
        child: Center(
          child: calculatorType.$2 == CardType.text ||
                  calculatorType.$2 == CardType.operator
              ? Text(
                  calculatorType.$1,
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF434A51),
                      fontSize: getFontSize(18)),
                )
              : SvgPicture.asset(
                  calculatorType.$1,
                  width: getFontSize(24),
                  height: getFontSize(24),
                ),
        ),
      ),
    );
  }
}
