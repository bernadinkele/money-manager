import 'package:flutter/material.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(44),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getWidth(16), vertical: getHeight(12)),
            filled: true,
            fillColor: Colors.white,
            hintText: "Account name",
            hintStyle: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.w500,
                color: const Color(0xFF858C94),
                fontSize: getFontSize(16)),
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFDADCE0), width: 0.5),
                borderRadius: BorderRadius.circular(getFontSize(8))),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFDADCE0), width: 0.5),
                borderRadius: BorderRadius.circular(getFontSize(8))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFFDADCE0), width: 0.5),
                borderRadius: BorderRadius.circular(getFontSize(8)))),
      ),
    );
  }
}
