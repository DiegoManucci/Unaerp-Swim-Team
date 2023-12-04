import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../utils/utils.dart';
import 'create_workout_state.dart';

class CreateWorkoutController extends ChangeNotifier {
  final CreateWorkoutState _state = CreateWorkoutState();
  final CollectionReference _workoutCollection = FirebaseFirestore.instance.collection("workouts");

  get createWorkoutFormKey => _state.createWorkoutFormKey;

  get descriptionController => _state.descriptionController;
  get dateController => _state.dateController;

  void onSave (BuildContext context) {
    if (!_state.createWorkoutFormKey.currentState!.validate()) {
      return;
    }

    try {
      _workoutCollection
          .doc(const Uuid().v4())
          .set({
              'description': _state.descriptionController.text,
              'date': _state.date
          });

      Navigator.pop(context);
      Utils.showCustomSnackBar(context, "Treino cadastrado com sucesso!");
    } catch (e) {
      print('Erro ao criar treino: $e');
      Utils.showCustomSnackBar(context, "Erro ao criar treino!");
    }
  }

  Future<void> showBirthDatePicker(BuildContext context) async {
    final DateTime? selectedDate = await Utils.showCustomDatePicker(context, _state.date);
    _state.date = selectedDate;
    _state.dateController.text = Utils.formatDate(selectedDate);
    notifyListeners();
  }
}