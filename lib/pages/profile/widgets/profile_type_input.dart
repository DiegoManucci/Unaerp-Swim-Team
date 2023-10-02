import 'package:flutter/material.dart';

import '../profile_controller.dart';

class ProfileTypeInput extends StatelessWidget {
  final ProfileController controller;

  const ProfileTypeInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.state.profileType,
      readOnly: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Tipo de Usuário',
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: controller.returnProfileTypeIcon(),
        ),
      ),
    );
  }
}