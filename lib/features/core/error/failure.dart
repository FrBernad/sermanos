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
  const FirebaseAuthFailure({required String message})
      : super(message: message);
}

class NewsNotFoundFailure extends Failure {
  const NewsNotFoundFailure() : super(message: _failureMessage);
  static const _failureMessage = "Invalid news id";
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
