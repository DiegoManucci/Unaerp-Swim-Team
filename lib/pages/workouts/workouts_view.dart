import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/application_controller.dart';
import 'package:unaerp_swim_team/types/user_type.dart';

import '../../utils/utils.dart';
import 'workouts_controller.dart';

class WorkoutsView extends StatelessWidget {
  final WorkoutsController controller = WorkoutsController();

  WorkoutsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<WorkoutsController>(
        builder: (context, controller, child) => Stack(
          children: [
            ListView.builder(
              itemCount: controller.workouts.length,
              itemBuilder: (context, index) {
                if (index < controller.workouts.length - 1) {
                  final workout = controller.workouts[index];
                  return Column(
                    children: [
                      const SizedBox(height: 8),
                      Card(
                        elevation: 0,
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            ListTile(
                              dense: true,
                              leading: const Icon(Icons.pool_outlined),
                              title: Text(workout.description),
                              subtitle: Text(Utils.formatDate(workout.date)),
                              trailing: IconButton(
                                icon: const Icon(Icons.more_vert_outlined),
                                onPressed: () => controller.onOpenActions(
                                    context, workout, controller),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox(
                    height: 86,
                  );
                }
              },
            ),
            Consumer<ApplicationController>(
              builder: (BuildContext context, ApplicationController value,
                  Widget? child) {
                return Visibility(
                  visible: value.user?.type == UserType.treinador,
                  child: Positioned(
                    bottom: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FloatingActionButton(
                        onPressed: () => controller.onAddUser(context),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
