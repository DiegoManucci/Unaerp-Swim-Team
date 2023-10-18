import 'package:flutter/material.dart';

class CreateWorkoutState {
  GlobalKey<FormState> createWorkoutFormKey = GlobalKey<FormState>();

  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime? date;
}
