import '../../domain/models/app_user_model.dart';

class AppUserEntity {
  static const String collectionName = 'users';

  final String id;
  final String name;
  final String surname;
  final String email;

  const AppUserEntity({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
  });

  factory AppUserEntity.fromJson(final String key, Map<String, dynamic> json) {
    return AppUserEntity(
      id: key,
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
    );
  }

  static AppUser toModel(AppUserEntity userEntity) {
    return AppUser(
      id: userEntity.id,
      name: userEntity.name,
      surname: userEntity.surname,
      email: userEntity.email,
    );
  }
}
