import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/pages/users/users_controller.dart';

import '../../utils/utils.dart';

class UsersView extends StatelessWidget {
  final UsersController controller = UsersController();

  UsersView({super.key});

  @override
  Widget build(BuildContext context) {

    controller.setupUsers(context);

    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<UsersController>(
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
                              leading: user.photoPath != ""
                                  ? FutureBuilder<Uint8List?>(
                                future: Utils.getUserPhotoUrl(user.photoPath!),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasData && snapshot.data != null) {
                                    return CircleAvatar(
                                      radius: 30,
                                      backgroundImage: Image.memory(snapshot.data!).image,
                                    );
                                  } else {
                                    return const Icon(Icons.person_outline);
                                  }
                                },
                              ) : const Icon(Icons.person_outline),
                              title: Text(user.name),
                              subtitle: Text(user.type.name),
                              trailing: IconButton(
                                icon: const Icon(Icons.more_vert_outlined),
                                onPressed: () {
                                  controller.onOpenActions(context, user, controller);
                                },
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
            Visibility(
              visible: controller.isAdministrator(context),
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
              ),)
            ),
          ],
        ),
      ),
    );
  }
}
