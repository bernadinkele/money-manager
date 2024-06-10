import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/app/app_dimensions/app_dimensions.dart';

showErrorMesssage({required BuildContext context, required String content}) {
  Flushbar(
    backgroundColor: Colors.red,
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: BorderRadius.circular(
      getFontSize(8),
    ),
    margin: EdgeInsets.all(
      getFontSize(24),
    ),
    title: "Erreur",
    titleColor: Colors.white,
    message: content,
    duration: const Duration(seconds: 3),
  ).show(context);
}

showSuccesMesssage({required BuildContext context, required String content}) {
  Flushbar(
    backgroundColor: Colors.green,
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: BorderRadius.circular(
      getFontSize(8),
    ),
    margin: EdgeInsets.all(
      getFontSize(24),
    ),
    title: "Succes",
    titleColor: Colors.white,
    message: content,
    duration: const Duration(seconds: 3),
  ).show(context);
}
