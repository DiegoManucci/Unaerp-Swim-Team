import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/pages/profile/profile_controller.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = ProfileController();

  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => controller,
        child: Consumer<ProfileController>(builder: (context, controller, child) {
          return Form(
              key: controller.state.profileFormKey,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(children: [
                  ToggleButtons(
                    direction: Axis.horizontal,
                    onPressed: (int index) {
                      controller.toggleProfileType(index);
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    selectedBorderColor: Colors.black,
                    selectedColor: Colors.white,
                    fillColor: Theme.of(context).colorScheme.primary,
                    color: Colors.black,
                    constraints: const BoxConstraints(
                      minHeight: 20.0,
                      minWidth: 100.0,
                    ),
                    isSelected: controller.state.profileTypesController,
                    children: controller.returnProfileTypes(),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.state.nameController,
                    validator: controller.nameValidator,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nome'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.state.emailController,
                    validator: controller.emailValidator,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Email'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.state.passwordController,
                    validator: controller.passwordValidator,
                    obscureText: controller.state.showPassword,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                          icon: Icon(
                            !controller.state.showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: controller.toggleShowPassword),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: controller.onSave,
                    child: const Text('Salvar'),
                  ),
                ]),
              ));
        }));
  }
}
