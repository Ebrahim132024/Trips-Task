import 'package:dartz/dartz.dart';
import 'package:webtriplist/core/error/failures.dart';
import 'package:webtriplist/domain/entities/trip.dart';
import 'package:webtriplist/domain/repositories/trips_repository.dart';

/// Use Case: Fetch all trips.
/// Encapsulates business logic for retrieving trips from repository.
class GetTrips {
  final TripsRepository repository;

  GetTrips(this.repository);

  /// Executes the use case.
  /// Returns Either<Failure, List<Trip>>
  Future<Either<Failure, List<Trip>>> call() async {
    return await repository.getTrips();
  }
}
