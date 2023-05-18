import '../../../domain/models/user_model.dart';

class RemoteUserEntity {
  final String id;
  final String email;

  const RemoteUserEntity({
    required this.id,
    required this.email,
  });

  factory RemoteUserEntity.fromJson(
      final String key, Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  static AppUser toModel(RemoteUserEntity userEntity) {
    throw UnimplementedError();

    return AppUser(
      email: userEntity.email,
      id: '',
    );
  }
}
