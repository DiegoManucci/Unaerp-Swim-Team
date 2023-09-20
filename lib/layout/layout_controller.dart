
import 'package:unaerp_swim_team/layout/layout_state.dart';

class LayoutController {
  final LayoutState state = LayoutState();

  void onItemTapped(int index) {
    state.selectedIndex = index;
  }
}