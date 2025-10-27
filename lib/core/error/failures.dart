import 'package:equatable/equatable.dart';

/// Base class for all failures in the app.
/// Used with `Either<Failure, T>` from dartz.
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Represents a failure while fetching local data (e.g., JSON or cache)
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

/// Represents a failure while fetching remote data (if you add APIs later)
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

/// Represents any unexpected or unknown failure
class UnknownFailure extends Failure {
  const UnknownFailure([String message = "Unknown error"]) : super(message);
}
