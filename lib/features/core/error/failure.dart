import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return message;
  }
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: _failureMessage);

  static const _failureMessage = "Server Failure";
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure({required String message}) : super(message: message);
}

class CacheFailure extends Failure {
  const CacheFailure() : super(message: _failureMessage);

  static const _failureMessage = "Cache Failure";
}

class EmergencyNotFoundFailure extends Failure {
  const EmergencyNotFoundFailure() : super(message: _failureMessage);

  static const _failureMessage = "Invalid emergency id";
}

class ContactNotFoundFailure extends Failure {
  const ContactNotFoundFailure() : super(message: _failureMessage);

  static const _failureMessage = "Invalid contact id";
}

class LearnEmergencyNotFoundFailure extends Failure {
  const LearnEmergencyNotFoundFailure() : super(message: _failureMessage);

  static const _failureMessage = "Invalid learn emergency id";
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure() : super(message: _failureMessage);

  static const _failureMessage = "Invalid user id";
}

class UnprocessableEntityFailure extends Failure {
  const UnprocessableEntityFailure({required super.message});
}
