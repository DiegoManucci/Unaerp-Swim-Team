import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_athlete_controller.dart';

class HomeAthleteView extends StatelessWidget {
  final HomeAthleteController controller = HomeAthleteController();

  HomeAthleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<HomeAthleteController>(
        builder: (context, controller, child) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
                title: Text(
                  controller.state.appPages[controller.state.selectedIndex].title,
                  textAlign: TextAlign.center,
                ),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      controller.onLogout(context);
                    },
                  ),
                ],
              ),
              body: Stack(children: [
                IndexedStack(
                  index: controller.state.selectedIndex,
                  children: controller.state.pages,
                ),
              ]),
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
                    icon: Icon(Icons.pool_outlined),
                    label: 'Treinos',
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
