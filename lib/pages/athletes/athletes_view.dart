import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'athletes_controller.dart';

class AthletesView extends StatelessWidget {
  final AthletesController controller = AthletesController();

  AthletesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<AthletesController>(
        builder: (context, controller, child) => Stack(
          children: [
        ListView.builder(
        itemCount: controller.state.users.length,
          itemBuilder: (context, index) {
            if (index < controller.state.users.length) {
              final user = controller.state.users[index];
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
                          leading: const Icon(Icons.person_outline),
                          title: Text(user.name),
                          subtitle: Text(user.type.name),
                          trailing: IconButton(
                            icon: const Icon(Icons.more_vert_outlined),
                            onPressed: () => controller.onOpenActions(context, user, controller),
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
            Positioned(
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
          ],
        ),
      ),
    );
  }
}
