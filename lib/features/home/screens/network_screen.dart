import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';

class NetWorkScreen extends StatelessWidget {
  const NetWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getFontSize(12)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getFontSize(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Net worth",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                    fontSize: getFontSize(16)),
              ),
              Container(
                padding: EdgeInsets.all(getFontSize(8)),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFDADCE0)),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(AssetsIcons.eyeOff),
              )
            ],
          ),
          const Gap(16),
          Row(
            children: [
              Text(
                "5,045,300",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w700,
                    fontSize: getFontSize(32)),
              ),
              const Gap(4),
              Text(
                "XOF",
                style: TextStyle(
                    color: const Color(0xFF434A51),
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w700,
                    fontSize: getFontSize(16)),
              )
            ],
          ),
          const Gap(32),
          Row(
            children: [
              Text(
                "0.35 (-3.70%)",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFC30626),
                    fontSize: getFontSize(12)),
              ),
              const Gap(10),
              Text(
                "NOW vs Q2",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF858C94),
                    fontSize: getFontSize(12)),
              )
            ],
          )
        ],
      ),
    );
  }
}

