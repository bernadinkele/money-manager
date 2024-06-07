import 'package:flutter/material.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.onTap});
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getHeight(44),
      child: FilledButton(
        style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.black),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(getFontSize(8))))),
        onPressed:onTap,
        child: Text(
          "Create",
          style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: getFontSize(16)),
        ),
      ),
    );
  }
}
