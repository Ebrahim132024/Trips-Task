import 'package:dartz/dartz.dart';
import 'package:webtriplist/core/error/failures.dart';
import 'package:webtriplist/domain/entities/trip.dart';

/// Abstract contract for fetching trips (from any source).
/// Implementations can come from local JSON, API, database, etc.
abstract class TripsRepository {
  /// Returns [Either<Failure, List<Trip>>]
  /// - [Right(List<Trip>)] when successful
  /// - [Left(Failure)] when something goes wrong
  Future<Either<Failure, List<Trip>>> getTrips();
}
