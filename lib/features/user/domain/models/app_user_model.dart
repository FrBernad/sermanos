import 'package:equatable/equatable.dart';
import 'package:sermanos/features/user/domain/models/gender.dart';

class AppUser extends Equatable {
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

  const AppUser({
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

  bool isProfileFilled() {
    return birthdate != null &&
        phone != null &&
        gender != null &&
        profileImageUrl != null &&
        emailContact != null;
  }

  String getFullName() {
    return '${name ?? ""} ${surname ?? ""}'.trim();
  }

  @override
  List<Object?> get props => [id, email];
}
