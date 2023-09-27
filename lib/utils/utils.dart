import 'package:flutter/material.dart';

class Utils {
  static String initcap(String value) {
    return value[0].toUpperCase() + value.substring(1).toLowerCase();
  }

  static void showCustomAlertDialog(BuildContext context, String title, String content, List<Widget> actions) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      actionsPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      title: Text(title), // Use the title parameter
      content: Text(content), // Use the content parameter
      actions: actions, // Use the actions parameter
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}