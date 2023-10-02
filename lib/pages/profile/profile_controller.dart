import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/profile/profile_state.dart';
import 'package:unaerp_swim_team/types/user_type.dart';

class ProfileController extends ChangeNotifier {
  final ProfileState state = ProfileState();

  Widget returnProfileTypeIcon() {
    if(state.profileType.text == UserType.administrador.name) {
      return const Icon(
          Icons.admin_panel_settings_outlined
      );
    }

    return const Icon(
        Icons.person_outlined
    );
  }
}
