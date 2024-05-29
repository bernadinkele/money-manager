import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({super.key, required this.tab});
  final Map<String, dynamic> tab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
