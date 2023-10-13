import 'package:flutter/material.dart';
import 'package:unaerp_swim_team/types/phone_type.dart';

class CreateUserState {
  GlobalKey<FormState> createUserFormKey = GlobalKey<FormState>();

  int selectedUserType = 0;
  List<bool> selectedUserTypeList = List.generate(3, (_) => false);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  DateTime? birthDate;
  TextEditingController sexController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController motherNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController naturalnessController = TextEditingController();
  TextEditingController nacionalityController = TextEditingController();
  TextEditingController clubOfOriginController = TextEditingController();
  TextEditingController workLocationController = TextEditingController();
  TextEditingController medicalInsuranceController = TextEditingController();
  TextEditingController medicationAllergyController = TextEditingController();
  TextEditingController stylesAndEventsController = TextEditingController();

  List<TextEditingController> phoneControllers = [];
  List<PhoneType> selectedPhoneTypes = [];

  String? medicalCertificatePath;
  String? rgPath;
  String? cpfPath;
  String? proofOfResidencePath;
  String? photoPath;
  String? signedRegulationPath;
}
