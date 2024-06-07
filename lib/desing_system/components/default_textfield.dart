import 'package:flutter/material.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.type});
  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(44),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: getWidth(16), vertical: getHeight(12)),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
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
