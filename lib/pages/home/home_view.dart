import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = HomeController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<HomeController>(
        builder: (context, controller, child) {
          return Scaffold(
              body: Stack(children: [
                IndexedStack(
                  index: controller.state.selectedIndex,
                  children: controller.state.pages,
                ),
              ]),
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
                title: Text(
                  controller.state.appPages[controller.state.selectedIndex].title,
                  textAlign: TextAlign.center,
                ),
                centerTitle: true,
              ),
              bottomNavigationBar: BottomNavigationBar(
                unselectedIconTheme: const IconThemeData(color: Colors.white),
                unselectedItemColor: Colors.white,
                selectedIconTheme: IconThemeData(
                    color: Theme.of(context).colorScheme.secondaryContainer),
                selectedItemColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                currentIndex: controller.state.selectedIndex,
                onTap: (int index) {
                  controller.onItemTapped(index);
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
        },
      ),
    );
  }
}
