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

  const AppUserEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
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
        birthdate = DateTime.parse(json['birthdate']);
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
      profileImageUrl: json['profileImageUrl'],
      phone: json['phone'],
      emailContact: json['emailContact'],
    );
  }

  static AppUser toModel(AppUserEntity userEntity) {
    return AppUser(
      id: userEntity.id,
      name: userEntity.name,
      surname: userEntity.surname,
      email: userEntity.email,
      gender: userEntity.gender,
      birthdate: userEntity.birthdate,
      profileImageUrl: userEntity.profileImageUrl,
      phone: userEntity.phone,
      emailContact: userEntity.emailContact,
    );
  }
}
