import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../types/user.dart';
import '../../types/workout.dart';
import '../../utils/utils.dart';
import 'evaluation_controller.dart';

class EvaluationView extends StatelessWidget {
  final EvaluationController controller = EvaluationController();

  late final User athlete;
  late final Workout workout;

  EvaluationView({super.key, required this.athlete, required this.workout});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double appBarHeight = AppBar().preferredSize.height;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.state.openInitialFrequencyDialog == false) {
        controller.showInitialFrequencyDialog(context);
      }
    });

    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<EvaluationController>(
        builder: (context, controller, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              titleTextStyle:
                  const TextStyle(fontSize: 20, color: Colors.white),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                "Avaliando: ${athlete.name}",
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
            body: Stack(children: [
              SizedBox(
                height: (screenHeight - appBarHeight) - 32,
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                      height: controller.state.laps.isNotEmpty
                          ? ((screenHeight - appBarHeight) - 32) * 0.25
                          : ((screenHeight - appBarHeight) - 32) * 0.75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Utils.formatTime(controller.state.fullTime),
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            Utils.formatTime(controller.state.lapTime),
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                      height: controller.state.laps.isNotEmpty
                          ? (screenHeight - appBarHeight) * 0.5
                          : 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: screenWidth * 0.33,
                                  child: const Text("Volta",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))),
                              SizedBox(
                                  width: screenWidth * 0.33,
                                  child: const Text("Tempo",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))),
                              SizedBox(
                                  width: screenWidth * 0.33,
                                  child: const Text("Geral",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Flexible(
                              flex: 1,
                              child: ListView.builder(
                                  itemCount: controller.state.laps.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: screenWidth * 0.33,
                                                child: Text(
                                                    "${controller.state.laps[index].number}",
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 25))),
                                            SizedBox(
                                                width: screenWidth * 0.33,
                                                child: Text(
                                                    Utils.formatTime(controller
                                                        .state
                                                        .laps[index]
                                                        .lapTime),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 20))),
                                            SizedBox(
                                                width: screenWidth * 0.33,
                                                child: Text(
                                                    Utils.formatTime(controller
                                                        .state
                                                        .laps[index]
                                                        .fullTime),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontSize: 20))),
                                          ],
                                        ));
                                  })),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      height: (screenHeight - appBarHeight) * 0.25,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                            FilledButton(
                                onPressed: () {
                                  controller.startTimer();
                                },
                                child: const Text("Iniciar")),
                          FilledButton(
                                onPressed: () {
                                  controller.makeLap();
                                },
                                child: const Text("Volta")),
                          FilledButton(
                              onPressed: () {
                                controller.stopTimer();
                              },
                              child: const Text("Parar")),
                          FilledButton(
                              onPressed: () {
                                controller.resetTimer();
                              },
                              child: const Text("Reiniciar")),
                        ],
                      )))),
            ])),
      ),
    );
  }
}
