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

class VolunteeringNotFoundFailure extends Failure {
  const VolunteeringNotFoundFailure() : super(message: _failureMessage);
  static const _failureMessage = "Invalid volunteering id";
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

class NonProcessableEntityFailure extends Failure {
  const NonProcessableEntityFailure({required super.message});
}

class NoVacancyAtVolunteeringFailure extends Failure {
  const NoVacancyAtVolunteeringFailure() : super(message: _failureMessage);

  static const _failureMessage = "No vacancy at volunteering";
}

class AlreadySubscribedInAVolunteeringFailure extends Failure {
  const AlreadySubscribedInAVolunteeringFailure()
      : super(message: _failureMessage);

  static const _failureMessage = "You are already subscribed in a volunteering";
}
