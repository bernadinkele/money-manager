import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({super.key, required this.tab, required this.onTap});
  final Map<String, dynamic> tab;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              tab['icon'],
              width: getFontSize(24),
              height: getFontSize(24),
            ),
            const Gap(8),
            Text(
              tab['label'],
              style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w500,
                  fontSize: getFontSize(12)),
            )
          ],
        ));
  }
}
