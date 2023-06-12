import 'dart:io';

import 'package:sermanos/features/user/domain/models/gender.dart';

class UserDataDto {
  final String phone;
  final Gender gender;
  final DateTime birthdate;
  final String emailContact;
  final File? profileImage;

  const UserDataDto({
    required this.phone,
    required this.gender,
    required this.birthdate,
    required this.emailContact,
    required this.profileImage,
  });
}
