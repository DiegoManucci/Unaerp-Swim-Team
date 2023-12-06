import 'dart:collection';

class GraphicsState {
  Map<String, List<int>> _atlhetesWithLaps = HashMap();

  Map<String, List<int>> get atlhetesWithLaps => _atlhetesWithLaps;
  set atlhetesWithLaps(Map<String, List<int>> value) => _atlhetesWithLaps = value;
}