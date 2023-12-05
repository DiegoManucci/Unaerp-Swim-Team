import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../login/login_view.dart';
import 'home_trainer_state.dart';

class HomeTrainerController extends ChangeNotifier {
  final HomeTrainerState state = HomeTrainerState();

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