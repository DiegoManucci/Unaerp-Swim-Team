import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/layout/layout_controller.dart';

class LayoutView extends StatefulWidget {
  final LayoutController controller = LayoutController();

  LayoutView({super.key});

  @override
  _LayoutViewState createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.controller.state.selectedIndex,
        children: widget.controller.state.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondaryContainer),
        selectedItemColor: Theme.of(context).colorScheme.secondaryContainer,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        currentIndex: widget.controller.state.selectedIndex,
        onTap: (int index) {
          setState(() {
            widget.controller.onItemTapped(index);
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Usuários',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
