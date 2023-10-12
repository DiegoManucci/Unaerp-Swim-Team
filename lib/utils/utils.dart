import 'package:flutter/material.dart';

class Utils {
  static String initcap(String value) {
    return value[0].toUpperCase() + value.substring(1).toLowerCase();
  }

  static void showCustomAlertDialog(BuildContext context, String title, String content, List<Widget> actions) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      actionsPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      title: Text(title),
      content: Text(content),
      actions: actions
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showCustomSnackBar(BuildContext context, String message, {Duration? duration, SnackBarAction? action}) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration ?? const Duration(seconds: 3),
      action: action
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showCustomBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  static Future<DateTime?> showCustomDatePicker(BuildContext context, DateTime? selectedDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
    }
    return selectedDate;
  }

  static bool doesEmailMatchRegex(String value) {
    String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(value);
  }

  static bool doesPasswordHaveAtLeastEightCharacters(value) {
    return value.length >= 8;
  }
}