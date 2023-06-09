import 'package:equatable/equatable.dart';

abstract interface class Failure extends Equatable {
  const Failure({required this.message, this.description = ""});

  final String message;
  final String description;

  @override
  List<Object?> get props => [message, description];
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: _failureMessage);

  static const _failureMessage = "Server Failure";
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure({
    required String message,
    required String description,
  }) : super(message: message, description: description);
}

class NewsNotFoundFailure extends Failure {
  const NewsNotFoundFailure() : super(message: _failureMessage);
  static const _failureMessage = "Invalid news id";
}

class SocialActionNotFoundFailure extends Failure {
  const SocialActionNotFoundFailure() : super(message: _failureMessage);
  static const _failureMessage = "Invalid social action id";
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super(message: _failureMessage);
  static const _failureMessage =
      "Failed when trying to connect with remote data source";
}

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure() : super(message: _failureMessage);

  static const _failureMessage = "Invalid user id";
}

class UnprocessableEntityFailure extends Failure {
  const UnprocessableEntityFailure({required super.message});
}
