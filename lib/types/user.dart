import 'package:unaerp_swim_team/types/user_type.dart';

class User {
  String? id;
  String name;
  String email;
  String password;
  UserType type;
  DateTime? birthDate;
  String? sex;
  String? address;
  String? motherName;
  String? fatherName;
  String? naturalness;
  String? nacionality;
  String? clubOfOrigin;
  String? workLocation;
  String? medicalInsurance;
  String? medicationAllergy;
  String? stylesAndEvents;
  List<String?>? phones;
  String? medicalCertificatePath;
  String? rgPath;
  String? cpfPath;
  String? proofOfResidencePath;
  String? photoPath;
  String? signedRegulationPath;

  User(this.id, this.name, this.email, this.password, this.type);
}