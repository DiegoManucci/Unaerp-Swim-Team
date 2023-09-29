import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/profile/profile_state.dart';

import '../../types/user_type.dart';
import '../../utils/utils.dart';

class ProfileController extends ChangeNotifier {
  final ProfileState state = ProfileState();

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!Utils.doesEmailMatchRegex(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!Utils.doesPasswordHaveAtLeastEightCharacters(value)) {
      return 'Senha deve ter pelo menos 8 caracteres';
    }
    return null;
  }

  List<Widget> returnProfileTypes() {
    return UserType.values
        .map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(e.name),
            ))
        .toList();
  }

  void toggleProfileType(int index) {
    for (int i = 0; UserType.values.length > i; i++) {
      if (i == index) {
        state.profileTypesController[i] = true;
        state.profileType = UserType.values[i].name;

        continue;
      }

      state.profileTypesController[i] = false;
    }

    notifyListeners();
  }

  void toggleShowPassword() {
    state.showPassword = !state.showPassword;
    notifyListeners();
  }

  void onSave() {
    if (!state.profileFormKey.currentState!.validate()) {
      return;
    }

    debugPrint(state.nameController.text);
    debugPrint(state.emailController.text);
    debugPrint(state.passwordController.text);
    debugPrint(state.profileType);
    debugPrint('Perfil Salvo!');
  }
}
