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
      create: (context) => UsersController(),
      child: Consumer<UsersController>(
        builder: (context, controller, child) => UsersList(controller: controller))
    );
  }
}
