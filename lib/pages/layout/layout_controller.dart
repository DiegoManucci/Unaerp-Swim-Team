import 'layout_state.dart';

class LayoutController {
  final LayoutState state = LayoutState();

  void onItemTapped(int index) {
    state.selectedIndex = index;
  }
}