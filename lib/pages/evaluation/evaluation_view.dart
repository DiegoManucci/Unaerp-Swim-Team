import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../types/user.dart';
import '../../types/workout.dart';
import 'evaluation_controller.dart';

class EvaluationView extends StatelessWidget {
  final EvaluationController controller = EvaluationController();

  final User athlete;
  final Workout workout;

  EvaluationView({super.key, required this.athlete, required this.workout});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<EvaluationController>(
        builder: (context, controller, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            titleTextStyle:
            const TextStyle(fontSize: 20, color: Colors.white),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Avaliar Atleta',
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Text('Avaliar Atleta'),
          ),
        )),
      );
  }
}
