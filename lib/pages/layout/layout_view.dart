import 'package:flutter/material.dart';

import 'layout_controller.dart';

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
        body: Stack(children: [
          IndexedStack(
            index: widget.controller.state.selectedIndex,
            children: widget.controller.state.pages,
          ),
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: widget.controller.state.selectedIndex == 0 ? FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: const Icon(
            Icons.add_outlined,
            color: Colors.blueGrey,
          ),
          onPressed: () {},
        ) : null,
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: BottomAppBar(
                height: 64,
                shape: const CircularNotchedRectangle(),
                color: Theme.of(context).colorScheme.tertiary,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(left: 64, right: 64),
                      color: widget.controller.state.selectedIndex == 0 ? Theme.of(context).colorScheme.secondaryContainer : Colors.white,
                      icon: const Icon(Icons.people_alt_outlined),
                      onPressed: () {
                        setState(() {
                          widget.controller.onItemTapped(0);
                        });
                      },
                    ),
                    Container(width: 64),
                    IconButton(
                      padding: const EdgeInsets.only(left: 64, right: 64),
                      color: widget.controller.state.selectedIndex == 1 ? Theme.of(context).colorScheme.secondaryContainer : Colors.white,
                      icon: const Icon(Icons.person_outlined),
                      onPressed: () {
                        setState(() {
                          widget.controller.onItemTapped(1);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
