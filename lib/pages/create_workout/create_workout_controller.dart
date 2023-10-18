import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'create_workout_state.dart';

class CreateWorkoutController extends ChangeNotifier {
  final CreateWorkoutState _state = CreateWorkoutState();

  get createWorkoutFormKey => _state.createWorkoutFormKey;

  get descriptionController => _state.descriptionController;
  get dateController => _state.dateController;

  void onSave(BuildContext context) {
    if (_state.createWorkoutFormKey.currentState!.validate()) {
      Utils.showCustomSnackBar(context, "Treino criado com sucesso!");
      Navigator.of(context).pop();
    }
  }

  Future<void> showBirthDatePicker(BuildContext context) async {
    final DateTime? selectedDate = await Utils.showCustomDatePicker(context, _state.date);
    _state.date = selectedDate;
    _state.dateController.text = Utils.formatDate(selectedDate);
    notifyListeners();
  }
}