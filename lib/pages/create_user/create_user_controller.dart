import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unaerp_swim_team/application_controller.dart';
import 'package:unaerp_swim_team/types/user_type.dart';

import '../../types/phone_type.dart';
import '../../utils/utils.dart';
import 'create_user_state.dart';

class CreateUserController extends ChangeNotifier {
  final CreateUserState state = CreateUserState();

  bool editMode = false;
  
  Future<void> fetchUser(BuildContext context) async {

    final ApplicationController appController = Provider.of<ApplicationController>(context, listen: false);

    Utils.getUser(appController.user?.id ?? '').then((user) {
      state.nameController.text = user!.name;
      state.emailController.text = user!.email;
      state.selectedUserType = UserType.values.indexOf(UserType.values.firstWhere((element) => element.name == user.type.name));
      state.birthDateController.text = user?.birthDate ?? '';
      state.sexController.text = user?.sex ?? '';
      state.addressController.text = user?.address ?? '';
      state.nacionalityController.text = user?.nacionality ?? '';
      state.naturalnessController.text = user?.naturalness ?? '';
      state.fatherNameController.text = user?.fatherName ?? '';
      state.motherNameController.text = user?.motherName ?? '';
      state.clubOfOriginController.text = user?.clubOfOrigin ?? '';
      state.stylesAndEventsController.text = user?.stylesAndEvents ?? '';
      state.workLocationController.text = user?.workLocation ?? '';
      state.medicalInsuranceController.text = user?.medicalInsurance ?? '';
      state.medicationAllergyController.text = user?.medicationAllergy ?? '';
      state.selectedPhoneTypes = user?.phones?.map((e) => PhoneType.values.firstWhere((element) => element.name == 'celular')).toList() ?? [];
      state.phoneControllers = user?.phones?.map((e) => TextEditingController(text: e)).toList() ?? [];
      state.medicalCertificatePath = user?.medicalCertificatePath ?? '';
      state.rgPath = user?.rgPath ?? '';
      state.cpfPath = user?.cpfPath ?? '';
      state.proofOfResidencePath = user?.proofOfResidencePath ?? '';
      state.photoPath = user?.photoPath ?? '';
      state.signedRegulationPath = user?.signedRegulationPath ?? '';
      notifyListeners();
    });
  }

  void setSelectedUserType(int index) {
    state.selectedUserType = index;
    notifyListeners();
  }

  int getSelectedUserType() {
    return state.selectedUserType;
  }

  List<bool> getSelectedUserTypeListState() {
    List<bool> selectedUserTypeList = List.generate(3, (_) => false);
    selectedUserTypeList[state.selectedUserType] = true;
    return selectedUserTypeList;
  }

  GlobalKey<FormState> getCreateUserFormKey() {
    return state.createUserFormKey;
  }

  TextEditingController getNameController() {
    return state.nameController;
  }

  TextEditingController getEmailController() {
    return state.emailController;
  }

  Future<void> createUser(BuildContext context, Function fetchUsers) async {
    if (!state.createUserFormKey.currentState!.validate()) {
      return;
    }

    try {
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: state.emailController.text,
        password: Utils.generateRandomPassword(8),
      );

      await FirebaseAuth.instance.sendPasswordResetEmail(email: state.emailController.text);

      String? userId = await Utils.createUser(result.user!.uid, state.nameController.text, state.emailController.text, UserType.values[state.selectedUserType].name);

      if (userId != null) {
        Utils.showCustomSnackBar(context, 'Usuário criado com sucesso');

        fetchUsers();

        Navigator.pop(context);

      } else {
        Utils.showCustomSnackBar(context, 'Erro ao criar usuário');
      }
    } catch (e) {
      print('Erro ao criar usuário: $e');
      Utils.showCustomSnackBar(context, 'Erro ao criar usuário');
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!Utils.doesEmailMatchRegex(value)) {
      return 'E-mail inválido';
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  TextEditingController getBirthDateController() {
    return state.birthDateController;
  }

  DateTime? getBirthDate() {
    return state.birthDate;
  }

  Future<void> showBirthDatePicker(BuildContext context) async {
    final DateTime? selectedDate = await Utils.showCustomDatePicker(context, state.birthDate);
    state.birthDate = selectedDate;
    state.birthDateController.text = Utils.formatDate(selectedDate);
    notifyListeners();
  }

  TextEditingController getNacionalityController() {
    return state.nacionalityController;
  }

  TextEditingController getSexController() {
    return state.sexController;
  }

  TextEditingController getAddressController() {
    return state.addressController;
  }

  TextEditingController getMotherNameController() {
    return state.motherNameController;
  }

  TextEditingController getFatherNameController() {
    return state.fatherNameController;
  }

  TextEditingController getClubOfOriginController() {
    return state.clubOfOriginController;
  }

  TextEditingController getWorkLocationController() {
    return state.workLocationController;
  }

  TextEditingController getMedicalInsuranceController() {
    return state.medicalInsuranceController;
  }

  TextEditingController getMedicationAllergyController() {
    return state.medicationAllergyController;
  }

  TextEditingController getNaturalnessController() {
    return state.naturalnessController;
  }

  TextEditingController getStylesAndEventsController() {
    return state.stylesAndEventsController;
  }

  List<dynamic> getPhoneControllers() {
    return state.phoneControllers;
  }

  void addPhone() {
    state.phoneControllers.add(TextEditingController());
    state.selectedPhoneTypes.add(PhoneType.celular);
    notifyListeners();
  }

  void removePhone(int index) {
    state.phoneControllers.removeAt(index);
    state.selectedPhoneTypes.removeAt(index);
    notifyListeners();
  }

  List<PhoneType> getSelectedPhoneTypes() {
    return state.selectedPhoneTypes;
  }

  void setSelectedPhoneType(int index, PhoneType phoneType) {
    state.selectedPhoneTypes[index] = phoneType;
    notifyListeners();
  }

  List<String> getPhoneTypes() {
    return PhoneType.values.map((e) => e.toString().split('.').last).toList();
  }

  void setMedicalCertificatePath(String path) {
    state.medicalCertificatePath = path;
    notifyListeners();
  }

  void setRgPath(String path) {
    state.rgPath = path;
    notifyListeners();
  }

  void setCpfPath(String path) {
    state.cpfPath = path;
    notifyListeners();
  }

  void setProofOfResidencePath(String path) {
    state.proofOfResidencePath = path;
    notifyListeners();
  }

  void setPhotoPath(String path) {
    state.photoPath = path;
    notifyListeners();
  }

  void setSignedRegulationPath(String path) {
    state.signedRegulationPath = path;
    notifyListeners();
  }

  String? getMedicalCertificatePath() {
    return state.medicalCertificatePath;
  }

  String? getRgPath() {
    return state.rgPath;
  }

  String? getCpfPath() {
    return state.cpfPath;
  }

  String? getProofOfResidencePath() {
    return state.proofOfResidencePath;
  }

  String? getPhotoPath() {
    return state.photoPath;
  }

  String? getSignedRegulationPath() {
    return state.signedRegulationPath;
  }

  String? birthDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? sexValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? nacionalityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? naturalnessValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? fatherNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? motherNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? clubOfOriginValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? stylesAndEventsValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? workLocationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? medicalInsuranceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? medicationAllergyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? medicalCertificateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? rgValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? cpfValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? proofOfResidenceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? photoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String? signedRegulationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  String phoneValidationMessage = '';

  Future<void> createAthlete(BuildContext context, Function fetchUsers) async {
    if (!state.createUserFormKey.currentState!.validate()) {
      return;
    }

    if (state.phoneControllers.length < 2) {
      phoneValidationMessage = 'Campo obrigatório, adicione pelo menos 2 telefones';
      notifyListeners();
      return;
    }

    try {

      String randomPassword = Utils.generateRandomPassword(8);

      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: state.emailController.text,
        password: randomPassword,
      );

      await Utils.createUser(result.user!.uid, state.nameController.text, state.emailController.text, UserType.values[state.selectedUserType].name);

      Map<String, dynamic> atlheteData = {};

      atlheteData['birthDate'] = state.birthDateController.text;
      atlheteData['sex'] = state.sexController.text;
      atlheteData['address'] = state.addressController.text;
      atlheteData['nacionality'] = state.nacionalityController.text;
      atlheteData['naturalness'] = state.naturalnessController.text;
      atlheteData['fatherName'] = state.fatherNameController.text;
      atlheteData['motherName'] = state.motherNameController.text;
      atlheteData['clubOfOrigin'] = state.clubOfOriginController.text;
      atlheteData['stylesAndEvents'] = state.stylesAndEventsController.text;
      atlheteData['workLocation'] = state.workLocationController.text;
      atlheteData['medicalInsurance'] = state.medicalInsuranceController.text;
      atlheteData['medicationAllergy'] = state.medicationAllergyController.text;
      atlheteData['phones'] = state.phoneControllers.map((e) => e.text).toList();
      atlheteData['medicalCertificatePath'] = state.medicalCertificatePath;
      atlheteData['rgPath'] = state.rgPath;
      atlheteData['cpfPath'] = state.cpfPath;
      atlheteData['proofOfResidencePath'] = state.proofOfResidencePath;
      atlheteData['photoPath'] = state.photoPath;
      atlheteData['signedRegulationPath'] = state.signedRegulationPath;

      await Utils.createAthlete(result.user!.uid, atlheteData);

      Utils.showCustomSnackBar(context, 'Usuário criado com sucesso');

      fetchUsers(context);

      Navigator.pop(context);
    } catch (e) {
      print('Erro ao criar usuário: $e');
      Utils.showCustomSnackBar(context, 'Erro ao criar usuário');
    }
  }

  Future<void> updateUser(BuildContext context, Function fetchUsers) async {
    if (!state.createUserFormKey.currentState!.validate()) {
      return;
    }

    final ApplicationController appController = Provider.of<ApplicationController>(context, listen: false);

    Map<String, dynamic> userData = {};

    userData['name'] = state.nameController.text;
    userData['email'] = state.emailController.text;
    userData['userType'] = UserType.values[state.selectedUserType].name;

    if(userData['type'] == UserType.atleta.name){
      userData['birthDate'] = state.birthDateController.text;
      userData['sex'] = state.sexController.text;
      userData['address'] = state.addressController.text;
      userData['nacionality'] = state.nacionalityController.text;
      userData['naturalness'] = state.naturalnessController.text;
      userData['fatherName'] = state.fatherNameController.text;
      userData['motherName'] = state.motherNameController.text;
      userData['clubOfOrigin'] = state.clubOfOriginController.text;
      userData['stylesAndEvents'] = state.stylesAndEventsController.text;
      userData['workLocation'] = state.workLocationController.text;
      userData['medicalInsurance'] = state.medicalInsuranceController.text;
      userData['medicationAllergy'] = state.medicationAllergyController.text;
      userData['phones'] = state.phoneControllers.map((e) => e.text).toList();
      userData['medicalCertificatePath'] = state.medicalCertificatePath;
      userData['rgPath'] = state.rgPath;
      userData['cpfPath'] = state.cpfPath;
      userData['proofOfResidencePath'] = state.proofOfResidencePath;
      userData['photoPath'] = state.photoPath;
      userData['signedRegulationPath'] = state.signedRegulationPath;
    }

    try {
      Utils.updateUser(appController.user?.id ?? '', userData);

      Utils.showCustomSnackBar(context, 'Usuário atualizado com sucesso');
    } catch (e) {
      print('Erro ao atualizar usuário: $e');
      Utils.showCustomSnackBar(context, 'Erro ao atualizar usuário');
    }
  }
}