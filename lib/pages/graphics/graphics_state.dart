import 'dart:collection';

import 'package:unaerp_swim_team/types/workout.dart';

class GraphicsState {
  Map<String, List<int>> _atlhetesWithLaps = HashMap();
  List<Workout> _workouts = [];

  Map<String, List<int>> get atlhetesWithLaps => _atlhetesWithLaps;
  set atlhetesWithLaps(Map<String, List<int>> value) => _atlhetesWithLaps = value;

  List<Workout> get workouts => _workouts;
  set workouts(List<Workout> value) => _workouts = value;
}