import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';

class DefaultNumberField extends StatelessWidget {
  const DefaultNumberField(
      {super.key, required this.onChange, required this.value});
  final Function(bool) onChange;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDADCE0), width: 0.5),
          borderRadius: BorderRadius.circular(getFontSize(8))),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            height: getHeight(44),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Add balance to net worth",
                  hintStyle: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF858C94),
                      fontSize: getFontSize(16)),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          )),
          const Gap(16),
          Switch(
            value: value,
            activeColor: const Color(0xFF34C759),
            onChanged: onChange,
          )
        ],
      ),
    );
  }
}
