import 'package:dartz/dartz.dart';
import 'package:webtriplist/app_exports.dart';

/// Implementation of [TripsRepository] that fetches data from local source.
class TripsRepositoryImpl implements TripsRepository {
  final TripsLocalDataSource localDataSource;

  TripsRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      final models = await localDataSource.getLocalTrips();
      final trips = models.map((m) => m.toEntity()).toList();
      return Right(trips);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
