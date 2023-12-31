import 'dart:async';

import '../../types/lap.dart';
import '../../types/user.dart';
import '../../types/workout.dart';

class EvaluationState {

  Workout? workout;

  List<User> _atlhetes = [];

  bool openInitialFrequencyDialog = false;

  int? initialFrequency = 0;
  int? finalFrequency = 0;

  String? initialFrequencyErrorText;
  String? finalFrequencyErrorText;

  User? _selectedAthlete;

  Timer? fullTimer;
  Timer? lapTimer;
  int fullTime = 0;
  int lapTime = 0;

  List<Lap> laps = [];

  String clockState = "Parado";

  List<User> get atlhetes => _atlhetes;
  set atlhetes(List<User> value) {
    _atlhetes = value;
  }

  User? get selectedAthlete => _selectedAthlete;
  set selectedAthlete(User? value) {
    _selectedAthlete = value;
  }
}