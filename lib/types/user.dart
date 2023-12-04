import 'package:unaerp_swim_team/types/user_type.dart';

class User {
  String? id;
  String name;
  String email;
  String password;
  UserType type;
  String? birthDate;
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

  User(
      this.id,
      this.name,
      this.email,
      this.password,
      this.type,
      this.birthDate,
      this.sex,
      this.address,
      this.motherName,
      this.fatherName,
      this.naturalness,
      this.nacionality,
      this.clubOfOrigin,
      this.workLocation,
      this.medicalInsurance,
      this.medicationAllergy,
      this.stylesAndEvents,
      this.phones,
      this.medicalCertificatePath,
      this.rgPath,
      this.cpfPath,
      this.proofOfResidencePath,
      this.photoPath,
      this.signedRegulationPath
      );
}