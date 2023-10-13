import 'package:flutter/material.dart';

import '../../types/phone_type.dart';
import '../../utils/utils.dart';
import 'create_user_state.dart';

class CreateUserController extends ChangeNotifier {
  final CreateUserState state = CreateUserState();

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

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!Utils.doesEmailMatchRegex(value)) {
      return 'E-mail inválido';
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
}