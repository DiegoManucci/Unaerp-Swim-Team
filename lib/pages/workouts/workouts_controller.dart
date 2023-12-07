import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/create_workout/create_workout_view.dart';
import 'package:unaerp_swim_team/pages/evaluation/evaluation_view.dart';
import 'package:unaerp_swim_team/pages/workouts/widgets/workouts_list_item_actions.dart';
import 'package:unaerp_swim_team/pages/workouts/workouts_state.dart';
import 'package:unaerp_swim_team/types/workout.dart';

import '../../types/user.dart';
import '../../utils/utils.dart';

class WorkoutsController extends ChangeNotifier {
  GlobalKey<FormState> dialogFormKey = GlobalKey<FormState>();

  WorkoutsController() {
    setupWorkouts();
    setupAthletes();
  }

  final WorkoutsState state = WorkoutsState();

  get selectedAthlete => state.selectedAthlete;

  set selectedAthlete(value) {
    state.selectedAthlete = value;
    notifyListeners();
  }

  void setWorkouts(List<Workout> workouts) {
    state.workouts = workouts;
  }

  void setupWorkouts() async {
    List<Workout> workouts = await _getWorkouts();
    setWorkouts(workouts);
    notifyListeners();
  }

  void setupAthletes() async {
    List<User> users = await Utils.listUsers();

    users.removeWhere((element) => element.type.name == 'administrador' || element.type.name == 'treinador');

    state.atlhetes = users;
    notifyListeners();
  }

  Future<List<Workout>> _getWorkouts() {
    try {
      return FirebaseFirestore.instance
          .collection('workouts')
          .get()
          .then((value) {
        List<Workout> workouts = [];

        value.docs.forEach((element) {
          workouts.add(
              Workout(
                  element.id,
                  element['description'],
                  DateTime.fromMillisecondsSinceEpoch(
                    (element['date'] as Timestamp).millisecondsSinceEpoch,
                  )
              )
          );
        });

        return workouts;
      });
    } catch (e) {
      print('Erro ao listar treinos: $e');
      throw e;
    }
  }

  Future<void> _deleteWorkout (String? workoutId) async {
    try {
      await FirebaseFirestore.instance.collection('workouts').doc(workoutId).delete();
    } catch (e) {
      print('Erro ao excluir treino: $e');
      throw e;
    }
  }

  void onOpenActions(
      BuildContext context, Workout workout, WorkoutsController controller) {
    Utils.showCustomBottomSheet(context,
        WorkoutsListItemActions(workout: workout, controller: controller));
  }

  void onRemoveWorkout(BuildContext context, Workout workout) {
    Utils.showCustomAlertDialog(
        context, 'Excluir treino', 'Deseja mesmo excluir esta treino?', [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Cancelar'),
      ),
      TextButton(
        onPressed: () {
          _deleteWorkout(workout.id);
          state.workouts.remove(workout);
          Utils.showCustomSnackBar(context, "Treino excluído com sucesso!");
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          notifyListeners();
        },
        child: const Text('Excluir'),
      ),
    ]);
  }

  void onAddUser(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateWorkoutView()))
        .then((value) {
            setupWorkouts();
            notifyListeners();
        });
  }

  void onEvaluateAthlete(BuildContext context, Workout workout) {
    Utils.showCustomDialog(
        context,
        'Selecionar atleta',
        Form(
          key: dialogFormKey,
          child: DropdownButtonFormField(
              decoration: const InputDecoration(
                labelText: 'Atleta',
                border: OutlineInputBorder(), // Add an outline border
              ),
              value: selectedAthlete,
              validator: selectedAthleteValidator,
              onChanged: (value) {
                selectedAthlete = value;
              },
              items: state.atlhetes
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name),
                      ))
                  .toList()),
        ),
        [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              if (!dialogFormKey.currentState!.validate()) {
                return;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EvaluationView(
                          athlete: selectedAthlete, workout: workout)));
              notifyListeners();
            },
            child: const Text('Selecionar'),
          ),
        ]);
  }

  String? selectedAthleteValidator(Object? value) {
    if (value == null) {
      return 'Selecione um atleta';
    }
    return null;
  }
}
