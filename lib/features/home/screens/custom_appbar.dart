import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';
import 'package:money_manager/desing_system/assets/assets_icons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
              horizontal: getWidth(24), vertical: getHeight(10))
          .copyWith(top: MediaQuery.of(context).padding.top+getHeight(8)),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xFFDADCE0)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           CircleAvatar(
            radius: 18,
            backgroundColor: const Color(0xFFF6F7F9),
            child: SvgPicture.asset(AssetsIcons.user),
          ),
          Text.rich(TextSpan(
              style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w300,
                  fontSize: getFontSize(24)),
              text: "M",
              children: [
                TextSpan(
                  text: "M",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w700,
                      fontSize: getFontSize(24)),
                )
              ])),
          GestureDetector(
              onTap: onTap, child: SvgPicture.asset(AssetsIcons.add))
        ],
      ),
    );
  }
}
