import 'package:flutter/material.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getHeight(44),
      child: FilledButton(
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Colors.black),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(getFontSize(8))))),
        onPressed: () {},
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
