import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static String initcap(String value) {
    return value[0].toUpperCase() + value.substring(1).toLowerCase();
  }

  static String formatDate(DateTime? date) {
    if (date == null) {
      return '';
    }
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  static String formatTime(int timeInMilliseconds) {

    NumberFormat doubleZerosFormatter = NumberFormat("00");
    NumberFormat tripleZerosFormatter = NumberFormat("000");

    int minutes = (timeInMilliseconds ~/ Duration.millisecondsPerMinute);
    int seconds = (timeInMilliseconds ~/ Duration.millisecondsPerSecond) - (minutes * 60);
    int milliseconds = (timeInMilliseconds) - (seconds * Duration.millisecondsPerSecond) - (minutes * Duration.millisecondsPerMinute);

    String minutesFormatted = doubleZerosFormatter.format(minutes);
    String secondsFormatted = doubleZerosFormatter.format(seconds);
    String millisecondsFormatted = tripleZerosFormatter.format(milliseconds);

    return '$minutesFormatted:$secondsFormatted.$millisecondsFormatted';
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

  static void showCustomDialog(BuildContext context, String title, Widget content, List<Widget> actions) {
    AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        actionsPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        title: Text(title),
        content: content,
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

  static Future<String?> getUserType(String uid) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        return userDoc['userType'];
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao buscar informações de usuário: $e');
      return null;
    }
  }

  static Future<String?> createUser(String userId, String name, String email, String userType) async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      await users.doc(userId).set({
        'name': name,
        'email': email,
        'userType': userType
      });
      return userId;
    } catch (e) {
      print('Erro ao criar usuário: $e');
      return null;
    }
  }

  static String generateRandomPassword(int length) {
    const charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_-+=<>?/{}[]|';

    Random random = Random();
    return List.generate(length, (index) => charset[random.nextInt(charset.length)]).join();
  }

  static Future<String?> createAthlete(String userId, Map<String, dynamic> athleteData) async {
    try {
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      await users.doc(userId.toString()).set(athleteData, SetOptions(merge: true));

      return userId.toString();
    } catch (e) {
      print('Erro ao criar atleta: $e');
      return null;
    }
  }

  static Future<void> attachDocumentsToAthlete(
      String athleteId,
      String? medicalCertificatePath,
      String? rgPath,
      String? cpfPath,
      String? proofOfResidencePath,
      String? photoPath,
      String? signedRegulationPath,
      ) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(athleteId).update({
        'medicalCertificatePath': medicalCertificatePath,
        'rgPath': rgPath,
        'cpfPath': cpfPath,
        'proofOfResidencePath': proofOfResidencePath,
        'photoPath': photoPath,
        'signedRegulationPath': signedRegulationPath,
      });
    } catch (e) {
      print('Erro ao anexar documentos ao atleta: $e');
      throw e;
    }
  }
}