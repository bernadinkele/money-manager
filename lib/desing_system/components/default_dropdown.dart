import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';

class DefaultDropDown extends StatelessWidget {
  const DefaultDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(16), vertical: getHeight(12)),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDADCE0), width: 0.5),
          borderRadius: BorderRadius.circular(getFontSize(8)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Icon",
            style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w500,
                color: const Color(0xFF434A51),
                fontSize: getFontSize(16)),
          ),
          Row(
            children: [
              SvgPicture.asset(
                AssetsIcons.bank,
                width: getFontSize(20),
                height: getFontSize(20),
              ),
              const Gap(8),
              SvgPicture.asset(
                AssetsIcons.arrow,
                width: getFontSize(16),
                height: getFontSize(16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
