import 'package:get_it/get_it.dart';
import 'package:webtriplist/app_exports.dart';

final sl = GetIt.instance;

/// Initializes and registers all dependencies for the app.
Future<void> initDependencies() async {
  // 🧩 Data Sources
  sl.registerLazySingleton<TripsLocalDataSource>(
        () => TripsLocalDataSourceImpl(),
  );

  // 🏛️ Repositories
  sl.registerLazySingleton<TripsRepository>(
        () => TripsRepositoryImpl(sl()),
  );

  // 🧠 Use Cases
  sl.registerLazySingleton<GetTrips>(
        () => GetTrips(sl()),
  );

  // 🎯 ViewModels
  sl.registerFactory<TripsViewModel>(
        () => TripsViewModel(sl()),
  );
}
