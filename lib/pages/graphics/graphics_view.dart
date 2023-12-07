import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/types/workout.dart';

import 'graphics_controller.dart';

class GraphicsView extends StatelessWidget {
  GraphicsView({super.key});

  final GraphicsController controller = GraphicsController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => controller,
        child: Consumer<GraphicsController>(
            builder: (context, controller, child) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 32.0, 0, 0),
                  child: DropdownMenu<Workout>(
                    width: MediaQuery.of(context).size.width - 50.0,
                    hintText: 'Selecione um Treino',
                    onSelected: (Workout? value) {
                      controller.selectWorkout(value);
                    },
                    dropdownMenuEntries: controller.state.workouts.map<DropdownMenuEntry<Workout>>((Workout value) {
                      return DropdownMenuEntry<Workout>(value: value, label: value.description);
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: SizedBox(
                    height: 500,
                    child:
                      controller.state.atlhetesWithLaps.isNotEmpty ?
                        controller.getGraphic() :
                        const Center(
                          child: Text("Nenhum Registro Encontrado!"),
                        )
                  ),
                )
              ]
            )
        )
    );
  }
}
