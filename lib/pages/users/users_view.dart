import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/pages/users/users_controller.dart';
import 'package:unaerp_swim_team/pages/users/widgets/users_list.dart';

class UsersView extends StatelessWidget {
  final UsersController controller = UsersController();

  UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<UsersController>(
        builder: (context, controller, child) => Stack(
          children: [
            UsersList(controller: controller),
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
