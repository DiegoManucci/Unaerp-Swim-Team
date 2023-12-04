

import '../../types/user.dart';
import '../../types/workout.dart';

class WorkoutsState {
  List<Workout> _workouts = [
    Workout(1, "Treino 1", DateTime.now()),
    Workout(2, "Treino 2", DateTime.now()),
    Workout(3, "Treino 3", DateTime.now()),
  ];

  List<User> _atlhetes = [];

  User? _selectedAthlete;

  List<Workout> get workouts => _workouts;
  set workouts(List<Workout> value) {
    _workouts = value;
  }

  List<User> get atlhetes => _atlhetes;
  set atlhetes(List<User> value) {
    _atlhetes = value;
  }

  User? get selectedAthlete => _selectedAthlete;
  set selectedAthlete(User? value) {
    _selectedAthlete = value;
  }
}