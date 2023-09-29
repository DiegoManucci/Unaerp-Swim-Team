import 'home_state.dart';

class HomeController {
  final HomeState state = HomeState();

  void onItemTapped(int index) {
    state.selectedIndex = index;
  }
}