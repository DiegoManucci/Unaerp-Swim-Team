import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'create_workout_controller.dart';

class CreateWorkoutView extends StatelessWidget {
  final CreateWorkoutController controller = CreateWorkoutController();

  CreateWorkoutView({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<CreateWorkoutController>(
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
                  title: const Text(
                    'Cadastrar Treino',
                    textAlign: TextAlign.center,
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: controller.createWorkoutFormKey,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 32,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: 16,
                            children: [
                              const Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Dados do Treino',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          )),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.black,
                                    height: 20,
                                    thickness: 2,
                                    indent: 0,
                                    endIndent: 0,
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: controller.descriptionController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Descrição'),
                              ),
                              TextFormField(
                                controller: controller.dateController,
                                onTap: () {
                                  controller.showBirthDatePicker(context);
                                },
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Data do Treino',
                                ),
                              ),
                            ],
                          ),
                          FilledButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () {},
                            child: const Text('Cadastrar'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
