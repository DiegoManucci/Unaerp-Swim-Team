import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unaerp_swim_team/pages/evaluation/evaluation_state.dart';

import '../../types/lap.dart';
import '../../utils/utils.dart';

class EvaluationController extends ChangeNotifier {
  final EvaluationState state = EvaluationState();

  void startTimer() {
    if (state.fullTimer != null) {
      state.fullTimer?.cancel();
    }

    if (state.lapTimer != null) {
      state.lapTimer?.cancel();
    }

    state.fullTimer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      state.fullTime = timer.tick;
      notifyListeners();
    });

    state.lapTimer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      state.lapTime = timer.tick;
      notifyListeners();
    });
  }

  void resetTimer() {
    state.fullTimer?.cancel();
    state.lapTimer?.cancel();
    startTimer();

    notifyListeners();
  }

  void stopTimer() {
    state.fullTimer?.cancel();
    state.lapTimer?.cancel();

    notifyListeners();
  }

  void makeLap() {
    state.lapTimer?.cancel();
    state.laps.insert(0, Lap(state.laps.length + 1, state.lapTime, state.fullTime));

    state.lapTimer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      state.lapTime = timer.tick;
      notifyListeners();
    });
  }

  void showInitialFrequencyDialog(BuildContext context){

    state.openInitialFrequencyDialog = true;
    notifyListeners();

    Utils.showCustomDialog(context, "Frequência inicial", TextFormField(
      onChanged: (value) {
        state.initialFrequency = int.parse(value);
        notifyListeners();
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: state.initialFrequencyErrorText,
          labelText: 'Freq. Inicial'),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
    ), [
      TextButton(
        onPressed: () {
          state.initialFrequency = 0;
          notifyListeners();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        child: const Text('Cancelar'),
      ),
      TextButton(
        onPressed: () {
          if (state.initialFrequency == 0 || state.initialFrequency == null) {
            state.initialFrequencyErrorText = "É obrigatório";
            notifyListeners();
            return;
          }
          notifyListeners();
          Navigator.of(context).pop();
        },
        child: const Text('Confirmar'),
      ),
    ]);
  }
}
