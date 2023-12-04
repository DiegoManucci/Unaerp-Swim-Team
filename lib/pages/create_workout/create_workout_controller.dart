import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../utils/utils.dart';
import 'create_workout_state.dart';

class CreateWorkoutController extends ChangeNotifier {
  final CreateWorkoutState _state = CreateWorkoutState();

  get createWorkoutFormKey => _state.createWorkoutFormKey;

  get descriptionController => _state.descriptionController;
  get dateController => _state.dateController;

  Future<void> showBirthDatePicker(BuildContext context) async {
    final DateTime? selectedDate = await Utils.showCustomDatePicker(context, _state.date);
    _state.date = selectedDate;
    _state.dateController.text = Utils.formatDate(selectedDate);
    notifyListeners();
  }

  void onSave (BuildContext context) {
    if (!_state.createWorkoutFormKey.currentState!.validate()) {
      return;
    }

    try {
      saveWorkout(_state.descriptionController.text, _state.date, FirebaseFirestore.instance.collection("workouts"));

      Navigator.pop(context);
      Utils.showCustomSnackBar(context, "Treino cadastrado com sucesso!");
    } catch (e) {
      print('Erro ao criar treino: $e');
      Utils.showCustomSnackBar(context, "Erro ao criar treino!");
    }
  }

  void saveWorkout (final String workoutDescription, final DateTime? workoutDate, final CollectionReference collection) {
    try {
      collection
          .doc(const Uuid().v4())
          .set({
                  'description': workoutDescription,
                  'date': workoutDate
               });
    } catch (e) {
      rethrow;
    }
  }
}