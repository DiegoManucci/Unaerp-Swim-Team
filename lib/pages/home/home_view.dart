import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomeView extends StatefulWidget {
  final HomeController controller = HomeController();

  HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          IndexedStack(
            index: widget.controller.state.selectedIndex,
            children: widget.controller.state.pages,
          ),
        ]),
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
        ));
  }
}
