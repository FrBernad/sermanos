import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String email;
  final String id;

  const AppUser({
    required this.email,
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
