import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/evaluation/evaluation_state.dart';

import '../../types/lap.dart';
import '../../utils/utils.dart';

class EvaluationController extends ChangeNotifier {
  final EvaluationState state = EvaluationState();

  int clockState = 0;

  double time = 0;
  double timeGeral = 0;

  void startTimer() {

    clockState = 1;

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

  void stopTimer(BuildContext context) {

    clockState = 0;

    Utils.showCustomAlertDialog(context, "Finalizar", "Deseja mesmo finalizar a avaliação?", [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          clockState = 1;
        },
        child: Text("Não"),
      ),
      TextButton(
        onPressed: () async {

          Map<String, dynamic> evaluation = {};

          evaluation["athlete"] = state.selectedAthlete?.id;
          evaluation["athleteName"] = state.selectedAthlete?.name;
          evaluation["workout"] = state.workout?.id;
          evaluation["initial_frequency"] = state.initialFrequency;
          evaluation["final_frequency"] = state.finalFrequency;
          evaluation["laps"] = state.laps.map((e) => e.lapTime).toList();

          state.fullTimer?.cancel();
          state.lapTimer?.cancel();

          await Utils.createEvaluation(evaluation);

          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();

          Utils.showCustomSnackBar(context, "Avaliação finalizada com sucesso!");
        },
        child: Text("Sim"),
      ),
    ]);
    //
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
}
