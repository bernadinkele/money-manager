import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';

class SecondaryCustomAppBar extends StatelessWidget {
  const SecondaryCustomAppBar({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
              horizontal: getWidth(24), vertical: getHeight(10))
          .copyWith(top: MediaQuery.of(context).padding.top + getHeight(8)),
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
