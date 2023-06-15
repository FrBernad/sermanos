import 'package:sermanos/features/user/domain/models/gender.dart';

import '../../domain/models/app_user_model.dart';

class AppUserEntity {
  static const String collectionName = 'users';

  final String id;
  final String name;
  final String surname;
  final String email;
  final String? phone;
  final Gender? gender;
  final DateTime? birthdate;
  final String? profileImageUrl;
  final String? emailContact;
  final bool allowEventTrackerPermission;

  const AppUserEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.allowEventTrackerPermission,
    this.phone,
    this.gender,
    this.birthdate,
    this.profileImageUrl,
    this.emailContact,
  });

  factory AppUserEntity.fromJson(
      final String userId, Map<String, dynamic> json) {
    Gender? gender;

    if (json['gender'] != null) {
      try {
        gender = Gender.getGenderFromString(json['gender']);
      } on StateError {
        gender = null;
      }
    }

    DateTime? birthdate;
    if (json['birthdate'] != null) {
      try {
        birthdate = DateTime.fromMillisecondsSinceEpoch(json['birthdate']);
      } on StateError {
        birthdate = null;
      }
    }

    return AppUserEntity(
      id: userId,
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      gender: gender,
      birthdate: birthdate,
      profileImageUrl: json['profileImage'],
      phone: json['phone'],
      allowEventTrackerPermission: json['allowEventTrackerPermission'],
      emailContact: json['emailContact'],
    );
  }

  AppUser toModel() {
    return AppUser(
      id: id,
      name: name,
      surname: surname,
      email: email,
      gender: gender,
      birthdate: birthdate,
      profileImageUrl: profileImageUrl,
      phone: phone,
      emailContact: emailContact,
      allowEventTrackerPermission: allowEventTrackerPermission,
    );
  }
}
