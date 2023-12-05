import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/pages/login/login_view.dart';
import 'package:unaerp_swim_team/utils/utils.dart';

import 'home_administrator_state.dart';

class HomeAdministratorController extends ChangeNotifier {
  final HomeAdministratorState state = HomeAdministratorState();

  void onItemTapped(int index) {
    state.selectedIndex = index;
    notifyListeners();
  }

  void onLogout(BuildContext context) {

    Utils.showCustomAlertDialog(context, 'Sair', 'Deseja mesmo sair?', [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Cancelar'),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
                (Route<dynamic> route) => false,
          );
        },
        child: const Text('Sair'),
      ),
    ]);
  }
}