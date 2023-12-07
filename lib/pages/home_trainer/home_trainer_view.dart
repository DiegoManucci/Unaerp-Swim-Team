import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_trainer_controller.dart';

class HomeTrainerView extends StatelessWidget {
  final HomeTrainerController controller = HomeTrainerController();

  HomeTrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<HomeTrainerController>(
        builder: (context, controller, child) {
          return Scaffold(
              appBar: AppBar(
                key: const Key('homeTrainerAppBar'),
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
                selectedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondaryContainer),
                selectedItemColor: Theme.of(context).colorScheme.secondaryContainer,
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                currentIndex: controller.state.selectedIndex,
                onTap: (int index) {
                  controller.onItemTapped(index);
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.pool_outlined),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    label: 'Treinos',
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.people_alt_outlined),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    label: 'Atletas',
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.graphic_eq_outlined),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    label: 'Gráficos',
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person_outlined),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    label: 'Perfil',
                  ),
                ],
              ));
        },
      ),
    );
  }
}
