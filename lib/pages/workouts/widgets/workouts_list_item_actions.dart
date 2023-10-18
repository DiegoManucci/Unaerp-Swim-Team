import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/application_controller.dart';
import 'package:unaerp_swim_team/types/user_type.dart';
import 'package:unaerp_swim_team/types/workout.dart';

import '../workouts_controller.dart';

class WorkoutsListItemActions extends StatelessWidget {
  final WorkoutsController controller;
  final Workout workout;

  const WorkoutsListItemActions({super.key, required this.workout, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            workout.description,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Consumer<ApplicationController>(
          builder: (BuildContext context, ApplicationController applicationController, Widget? child) {
            return Visibility(
              visible: applicationController.user?.type == UserType.treinador,
              child: ListTile(
                leading: const Icon(Icons.delete_outline),
                title: const Text("Excluir"),
                onTap: () {
                  controller.onRemoveWorkout(context, workout);
                },
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.timer_outlined),
          title: const Text("Avaliar Atleta"),
          onTap: () {
            controller.onEvaluateAthlete(context, workout);
          },
        ),
      ],
    );
  }
}
