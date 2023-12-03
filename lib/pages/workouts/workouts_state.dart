import 'package:unaerp_swim_team/types/user_type.dart';

import '../../types/user.dart';
import '../../types/workout.dart';

class WorkoutsState {
  List<Workout> _workouts = [];

  List<User> _atlhetes = [
    User('1',"Atleta 1", "Atleta 1", "", UserType.atleta),
    User('1',"Atleta 2", "Atleta 2", "", UserType.atleta),
    User('1',"Atleta 3", "Atleta 3", "", UserType.atleta),
  ];

  User? _selectedAthlete;

  List<Workout> get workouts => _workouts;
  set workouts(List<Workout> value) => _workouts = value;

  List<User> get atlhetes => _atlhetes;
  set atlhetes(List<User> value) => _atlhetes = value;


  User? get selectedAthlete => _selectedAthlete;
  set selectedAthlete(User? value) => _selectedAthlete = value;
}