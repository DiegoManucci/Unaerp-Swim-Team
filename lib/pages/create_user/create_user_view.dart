import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../types/phone_type.dart';
import '../../widgets/file_upload_field.dart';
import 'create_user_controller.dart';

class CreateUserView extends StatelessWidget {
  final CreateUserController controller = CreateUserController();
  final int? defaultUserType;
  final Function fetchUsers;

  CreateUserView({super.key, required this.defaultUserType, required this.fetchUsers}){
    controller.setSelectedUserType(defaultUserType ?? 0);
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => controller,
      child: Consumer<CreateUserController>(
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
                    'Cadastrar Usuário',
                    textAlign: TextAlign.center,
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Form(
                    key: controller.getCreateUserFormKey(),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 32,
                        children: [
                          Visibility(
                            visible: defaultUserType != 2,
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              runSpacing: 16,
                              children: [
                                const Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Tipo de Usuário',
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
                                ToggleButtons(
                                  direction: Axis.horizontal,
                                  onPressed: controller.setSelectedUserType,
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(5)),
                                  selectedBorderColor: Colors.black,
                                  selectedColor: Colors.white,
                                  fillColor:
                                      Theme.of(context).colorScheme.primary,
                                  color: Colors.black,
                                  constraints: const BoxConstraints(
                                    minHeight: 20.0,
                                    minWidth: 100.0,
                                  ),
                                  isSelected:
                                      controller.getSelectedUserTypeListState(),
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Administrador',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Treinador',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Atleta',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: 16,
                            children: [
                              const Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Dados da Conta',
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
                                controller: controller.getNameController(),
                                validator: controller.nameValidator,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Nome'),
                              ),
                              TextFormField(
                                controller: controller.getEmailController(),
                                validator: controller.emailValidator,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email'),
                              ),
                            ],
                          ),
                          controller.getSelectedUserType() == 2
                              ? Wrap(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 16,
                                  children: [
                                      const Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Dados do Atleta',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                            ),
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
                                      controller: controller.getBirthDateController(),
                                      onTap: () {
                                        controller.showBirthDatePicker(context);
                                      },
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Data de Nascimento',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getSexController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Sexo',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getAddressController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Endereço',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getNaturalnessController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Naturalidade',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getNacionalityController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Nacionalidade',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getMotherNameController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Nome da Mãe',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getFatherNameController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Nome do Pai',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getClubOfOriginController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Clube de Origem',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getStylesAndEventsController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Estilos e Provas',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getWorkLocationController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Local de Trabalho',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getMedicalInsuranceController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Convênio Médico',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: controller.getMedicationAllergyController(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Alergia a Medicamentos',
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          controller.getSelectedUserType() == 2
                              ? Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: 16,
                            children: [
                              const Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Telefones',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
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
                              SizedBox(
                                width: screenWidth,
                                height: (controller.getPhoneControllers().length * 80.0) + 46.0,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.getPhoneControllers().length + 1,
                                  itemBuilder: (BuildContext context, int index) {
                                    if (index == controller.getPhoneControllers().length) {
                                      return ElevatedButton(
                                        onPressed: () {
                                          controller.addPhone();
                                        },
                                        child: const Text('Adicionar Telefone'),
                                      );
                                    }
                                    return Container(
                                      margin: const EdgeInsets.fromLTRB(0,0, 0, 16)   ,
                                      width: screenWidth,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                              child: DropdownButton<String>(
                                                value: controller.getSelectedPhoneTypes()[index].name,
                                                onChanged: (String? value) {
                                                  controller.setSelectedPhoneType(index, PhoneType.values.firstWhere((PhoneType phoneType) => phoneType.name == value));
                                                },
                                                items: PhoneType.values.map((PhoneType phoneType) {
                                                  return DropdownMenuItem<String>(
                                                    value: phoneType.name,
                                                    child: Text(
                                                      phoneType.name,
                                                      style: const TextStyle(
                                                        fontSize: 16.0,
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                underline: const SizedBox(),
                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: TextFormField(
                                              controller: controller.getPhoneControllers()[index],
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                labelText: 'Número',
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: IconButton(
                                              onPressed: () {
                                                controller.removePhone(index);
                                              },
                                              icon: const Icon(Icons.remove_circle_outline),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                              : const SizedBox(),
                          controller.getSelectedUserType() == 2
                              ? Wrap(
                            alignment: WrapAlignment.center,
                            runSpacing: 16,
                            children: [
                              const Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Anexos',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
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
                              FileUploadField(
                                documentType: 'Atestado Médico',
                                filePath: controller.getMedicalCertificatePath() ?? '',
                                onFileSelected: (path) {
                                  controller.setMedicalCertificatePath(path);
                                },
                              ),
                              FileUploadField(
                                documentType: 'RG',
                                filePath: controller.getRgPath() ?? '',
                                onFileSelected: (path) {
                                  controller.setRgPath(path);
                                },
                              ),
                              FileUploadField(
                                documentType: 'CPF',
                                filePath: controller.getCpfPath() ?? '',
                                onFileSelected: (path) {
                                  controller.setCpfPath(path);
                                },
                              ),
                              FileUploadField(
                                documentType: 'Comprovante de Residência',
                                filePath: controller.getProofOfResidencePath() ?? '',
                                onFileSelected: (path) {
                                  controller.setProofOfResidencePath(path);
                                },
                              ),
                              FileUploadField(
                                documentType: 'Foto',
                                filePath: controller.getPhotoPath() ?? '',
                                onFileSelected: (path) {
                                  controller.setPhotoPath(path);
                                },
                              ),
                              FileUploadField(
                                documentType: 'Regulamento Assinado',
                                filePath: controller.getSignedRegulationPath() ?? '',
                                onFileSelected: (path) {
                                  controller.setSignedRegulationPath(path);
                                },
                              ),
                            ],
                          )
                              : const SizedBox(),
                          FilledButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () => {
                              (controller.state.selectedUserType == 0 || controller.state.selectedUserType == 1)
                                  ? controller.createUser(context, fetchUsers)
                                  : controller.createAthlete(context, fetchUsers)
                            },
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
