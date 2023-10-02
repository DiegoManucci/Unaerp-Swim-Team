import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/pages/profile/profile_controller.dart';
import 'package:unaerp_swim_team/pages/profile/widgets/profile_type_input.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = ProfileController();

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => controller,
        child:
            Consumer<ProfileController>(builder: (context, controller, child) {
          return SingleChildScrollView(
              child: Form(
                  key: controller.state.profileFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(children: [
                      const SizedBox(height: 30),
                      ProfileTypeInput(controller: controller),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: controller.state.nameController,
                        readOnly: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Nome'),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: controller.state.emailController,
                        readOnly: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Email'),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: controller.state.birthdayDateController,
                        readOnly: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Data de Nascimento',
                            hintText: 'dd/MM/yyyy'),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: controller.state.rgController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'RG',
                                  hintText: '99.999.999-9'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: TextFormField(
                              controller: controller.state.cpfController,
                              readOnly: true,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'CPF',
                                  hintText: '999.999.999-99'),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: controller.state.sexController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Sexo',
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: controller.state.phoneController,
                        readOnly: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Telefone',
                            hintText: '+99 (99) 99999-9999'),
                      ),
                    ]),
                  )));
        }));
  }
}
