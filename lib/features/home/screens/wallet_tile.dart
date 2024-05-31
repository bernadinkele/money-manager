import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';

class WalletTile extends StatelessWidget {
  const WalletTile({super.key, this.activeBorder = false});
  final bool? activeBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
       // border: Border.all(color: const Color(0xFFDADCE0), width: 0.5),
       // borderRadius: BorderRadius.circular(getFontSize(8))
      ),
      padding: EdgeInsets.symmetric(
          horizontal: getWidth(
            12,
          ),
          vertical: getHeight(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: getFontSize(16),
                    backgroundColor: const Color(0xFFDADCE0),
                  ),
                  const Gap(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UBA Bank",
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: getFontSize(14)),
                      ),
                      const Gap(4),
                      Text(
                        "501234567890",
                        style: TextStyle(
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF858C94),
                            fontSize: getFontSize(12)),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text("1,661,858",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: getFontSize(18))),
                  const Gap(4),
                  Text("XOF",
                      style: TextStyle(
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: getFontSize(9))),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
